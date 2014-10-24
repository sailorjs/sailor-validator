## -- Dependencies -------------------------------------------------------------

_                = require 'lodash'
expressValidator = require 'express-validator-errors'

## -- Class --------------------------------------------------------------------

class validateGenerator

  @begin: (req, res) ->
    @_req = req
    @_res = res
    @_validate = {}
    this

  @add: (param, message, condition, expected=undefined)->
    @_validate[param] = {} unless @_validate[param]?
    @_validate[param][condition] = message: message, value: expected
    this

  @end: (cb) ->
    params = Object.keys(@_validate)
    _.forEach params, (param) =>
      conditions =  Object.keys(@_validate[param])
      _.forEach conditions, (condition) =>
        if @_validate[param][condition].value?
          @_req.assert(param, @_validate[param][condition].message)[condition](@_validate[param][condition].value)
        else
          @_req.assert(param, @_validate[param][condition].message)[condition]()

    if @_req.validationErrors()
      errors = expressValidator.serialize(@_req)
      return @_res.badRequest(errors)

    cb(@_req.allParams())

## -- Exports ------------------------------------------------------------------

exports = module.exports = validateGenerator
