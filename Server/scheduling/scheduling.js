const mongoose = require('mongoose');
var Agenda = require('agenda');
var moment = require('moment');
var dotenv = require('dotenv');
var User = require('../models/User');


dotenv.load({
  path: './config/vars.env'
});

const plaidClient = require('../config/plaid');
var agenda = new Agenda ({db:{address: process.env.MONGODB , collection: 'jobs'}});


/*
 * Wait for init of scheduler
 *
 */
agenda.on('ready', () => {

  var job = agenda.create('Fetch New Transactions');
  job.save(function(err) {
    console.log("Job successfully saved");
  });
  job.repeatEvery('30 0 * * *', {
    timezone: 'America/New_York'
  });
  agenda.start()
})

/*
 * Loggers for console
 *
 */
agenda.on('start', function(job) {
  console.log("\nSTARTED: '%s'  on " + moment().format("dddd, MMMM Do YYYY, h:mm:ss a"), job.attrs.name);
});

agenda.on('complete', function(job) {
  console.log("FINISHED: '%s' finished on " + moment().format("dddd, MMMM Do YYYY, h:mm:ss a")+ "\n", job.attrs.name);
});


/*
 * Job to update user Transactions
 *
 */
 agenda.define('Fetch New Transactions', function(job, done) {
   console.log("PROCESSING: Fetch New Transactions");

   User.find({}).then(function(users) {
     users.forEach(function(user) {
         const access_token = user.plaidAccessKey;
        //  console.log("Access Token: " + access_token)

         var startDate = moment().subtract(190, 'days').format('YYYY-MM-DD');
         var endDate = moment().subtract(0, 'days').format('YYYY-MM-DD');
         plaidClient.getTransactions(access_token, startDate, endDate, {
             count: 500,
             offset: 0,
         }, function(error, transactionsResponse) {
             if (error != null) {
                 console.log(JSON.stringify(error));
                 return console.log({error: error});
             }
            //  console.log('pulled ' + transactionsResponse.transactions.length + ' transactions');
            //  console.log(transactionsResponse.transactions);

             //GET NEW AND OLD TRANSACTIONS
             transactions = transactionsResponse.transactions
             userTransactions = user.transactions

             //COMPARE THEM TO FIND DIFFERENCE IN
             var newTransactions = transactions.filter(function(current){
                 return userTransactions.filter(function(current_b){
                     return current_b.transaction_id == current.transaction_id
                 }).length == 0
             });

             //THIS PROBOBALY IS NOT NECESSARY, NOW THAT CONCAT FUNCTION IS
             // WORKING, BUT I DON'T WANT TO BREAK IT NOW.  TO FIX LATER
             if(userTransactions == null){
               user.transactions = transactions
             } else {
               userTransactions = userTransactions.concat(newTransactions)
               userTransactions.sort(custom_sort)
               user.transactions = userTransactions
             }
            //  console.log(user.transactions)

             user.save(function(err){
               console.log({ /*user: user,*/ msg: newTransactions.length +' new transactions added for ' + user.email + ' have been updated.' });
             });

         });
       });
       done();
    });
 });

 function custom_sort(a, b) {
     return new Date(b.date).getTime() - new Date(a.date).getTime();
 }
