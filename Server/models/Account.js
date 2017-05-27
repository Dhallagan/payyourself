var mongoose = require('mongoose');

var schemaOptions = {
  timestamps: true,
  toJSON: {
    virtuals: true
  }
};

var accountSchema = new mongoose.Schema({
  user_id: []{
    type: mongoose.Schema.Types.ObjectId, ref: 'User'
  }],
	availableCash: Number,
	buyingPower: Number, // Needs to be number
	dayAbsoluteReturn: Number, // Needs to be number
	dayPercentReturn: Number, // Needs to be decimal
	longMessages: String,//
	shortMessage: String, //Account Overview successfully fetched,
	status: String, //Success
	marginCash: Number, // Needs to be number
	totalAbsoluteReturn: Number, // Needs to be number
	totalPercentReturn: Number, // Needs to be number
	totalValue: Number, // Needs to be number
});



var Account = mongoose.model('Account', accountSchema);

module.exports = User;
