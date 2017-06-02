
var Agenda = require('agenda');
var moment = require('moment');
var agenda = new Agenda ({db:{address: 'mongodb://localhost/beta_payyourself' , collection: 'jobs'}});


agenda.define('Fetch New Transactions', function(job) {
  console.log("PROCESSING - Getting new transactions...");
});

agenda.on('start', function(job) {
  console.log("Job '%s' started on " + moment().format('LLLL'), job.attrs.name);
});

agenda.on('complete', function(job) {
  console.log("Job '%s' finished on " + moment().format('LLLL')+ "\n", job.attrs.name);
});

agenda.on('ready', () => {
  agenda.now('Fetch New Transactions');
  agenda.every('1 minute', 'Fetch New Transactions');
  agenda.start()
})
