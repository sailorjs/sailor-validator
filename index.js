/**
 * Dependencies
 */
var CoffeeScript    = require("coffee-script");
var expressValidator = require('express-validator/node_modules/validator');
var _                = require('lodash');
var validateGenerator= require("./lib/validateGenerator");

// Register CoffeeScript if exits
if(CoffeeScript.register) CoffeeScript.register();

var validator = _.assign(expressValidator, validateGenerator);

/**
 * Exports
 */
 exports = module.exports = validator;
