
var Agenda = require('agenda');
var moment = require('moment');
var dotenv = require('dotenv');
const mongoose = require('mongoose');
var User = require('../models/User');

dotenv.load({
  path: './config/vars.env'
});

var agenda = new Agenda ({db:{address: process.env.MONGODB , collection: 'jobs'}});


/*
 * Wait for init of scheduler
 *
 */
agenda.on('ready', () => {
  agenda.now('Fetch New Transactions');
  agenda.every('1 minute', 'Fetch New Transactions');
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
 agenda.define('Fetch New Transactions', function(job) {
   console.log("PROCESSING: Fetch New Transactions");

   User.find({}).then(function(users) {
     var jobQueries = [];

     users.forEach(function(user) {
       console.log("   User: " + user.name + " | Plaid: " + user.plaidAccessKey + " | Transactions: " + user.transactions);
     });
   });

 });
