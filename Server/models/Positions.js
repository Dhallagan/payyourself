var crypto = require('crypto');
var bcrypt = require('bcrypt-nodejs');
var mongoose = require('mongoose');

var schemaOptions = {
  timestamps: true,
  toJSON: {
    virtuals: true
  }
};

var positionsSchema = new mongoose.Schema({
  user_id: []{
    type: mongoose.Schema.Types.ObjectId, ref: 'User'
  }],
    symbol: String,
    symbolClass: String,
  	costbasis: Number,
  	holdingType: String,
  	lastPrice: Number,
  	quantity: Number,
  	todayGainLossDollar: Number,
  	todayGainLossPercentage: Number,
  	totalGainLossDollar: Number,
  	totalGainLossPercentage: Number,
    purchaseDate: Date,
    soldDate: Date
});



var Positions = mongoose.model('Positions', positionsSchema);

module.exports = User;
