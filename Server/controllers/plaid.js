const plaid = require('plaid');

const client_id = process.env.CLIENT_ID;
const secret = process.env.SECRET;
const public_key = process.env.PUBLIC_KEY;
const plaid_env = process.env.PLAID_ENV;
const options = ""

const plaidClient = new plaid.Client(client_id, secret, public_key, plaid_env, options);

module.exports = plaidClient;


// plaidClient.exchangePublicToken(public_token, function(err, res) {
//   const access_token = res.access_token;
// 
//   console.log(access_token)
//   });
// 
// plaidClient.getAccounts(access_token, function(err, res) {
//    console.log(res.accounts);
// });
