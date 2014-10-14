## -- Dependencies -------------------------------------------------------------

_                = require 'lodash'
async            = require 'async'
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

  @find: ->
    this

  @end: (cb) ->
    console.log @_validate
    params = Object.keys(@_validate)

    _.forEach params, (param) =>
      conditions =  Object.keys(@_validate[param])
      _.forEach conditions, (condition) =>
        if @_validate[param][condition].value?
          @_req.assert(param, @_validate[param].message)[condition](@_validate[param][condition].value)
        else
          @_req.assert(param, @_validate[param].message)[condition]()

    return @_res.badRequest(expressValidator.serialize(@_req)) if @_req.validationErrors()
    allParams = {}
    _.forEach params, (param) =>
      allParams[param] = @_req.param "#{param}"

    cb(allParams)

## -- Exports ------------------------------------------------------------------

exports = module.exports = validateGenerator
