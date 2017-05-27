// var async = require('async');
var crypto = require('crypto');
// var nodemailer = require('nodemailer');
// var jwt = require('jsonwebtoken');
var moment = require('moment');
var request = require('request');
var qs = require('querystring');
var User = require('../models/User');
var Account = require('../models/Account');


/**
 * Login required middleware
 */
exports.ensureAuthenticated = function(req, res, next) {
  if (req.isAuthenticated()) {
    next();
  } else {
    res.status(401).send({ msg: 'Unauthorized' });
  }
};


/**
 * Login required middleware
 */
exports.brokerageAccountGet = function(req, res, next) {
  if (req.isAuthenticated()) {
    next();
  } else {
    res.send({ msg: 'Reached Login' });
  }
};

/**
 * POST /signup
 */
exports.createBrokerageAccountPost = function(req, res, next) {
  console.log(req.body)
  req.assert('name', 'Name cannot be blank').notEmpty();
  req.assert('email', 'Email is not valid').isEmail();
  req.assert('email', 'Email cannot be blank').notEmpty();
  req.assert('password', 'Password must be at least 4 characters long').len(4);
  req.sanitize('email').normalizeEmail({ remove_dots: false });

  var errors = req.validationErrors();

  if (errors) {
    return res.status(400).send(errors);
  }

  User.findOne({ email: req.body.email }, function(err, user) {
    if (user) {
    return res.status(400).send({ msg: 'The email address you have entered is already associated with another account.' });
    }
    user = new User({
      name: req.body.name,
      email: req.body.email,
      password: req.body.password
    });
    user.save(function(err) {
    res.send({ token: generateToken(user), user: user });
    });
  });
};
