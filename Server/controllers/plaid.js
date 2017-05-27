const plaid = require('plaid');

const client_id = "590e618bbdc6a44cd258c20c"
const secret = "80fc7ebb3c6e485f330ec4106b2253"
const public_key = "eb42c0dd0514ad997fb1677fcf68f0"
const plaid_env = plaid.environments.sandbox
const options = ""

const client_id = "590e618bbdc6a44cd258c20c"
const secret = "80fc7ebb3c6e485f330ec4106b2253"
const public_key = "eb42c0dd0514ad997fb1677fcf68f0"
const plaid_env = plaid.environments.sandbox
const options = ""

const plaidClient = new plaid.Client(client_id, secret, public_key, plaid_env, options );


plaidClient.exchangePublicToken(public_token, function(err, res) {
  const access_token = res.access_token;

  console.log(access_token)
  });

plaidClient.getAccounts(access_token, function(err, res) {
    console.log(res.accounts);
});
