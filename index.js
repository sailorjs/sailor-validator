/**
 * Dependencies
 */
var expressValidator = require('express-validator/node_modules/validator');
var _                = require('lodash');

var validator = _.assign(expressValidator, {});

/**
 * Exports
 */
 exports = module.exports = validator;
