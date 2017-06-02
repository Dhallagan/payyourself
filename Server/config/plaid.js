const plaid = require('plaid');

const client_id = process.env.CLIENT_ID;
const secret = process.env.SECRET;
const public_key = process.env.PUBLIC_KEY;
const plaid_env = process.env.PLAID_ENV;

const plaidClient = new plaid.Client(client_id, secret, public_key, plaid_env);

module.exports = plaidClient;
