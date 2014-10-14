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

  @end: (cb) ->
    params = Object.keys(@_validate)
    async.each params, (param) =>
      conditions =  Object.keys(@_validate[param])
      async.each conditions, (condition) =>
        if @_validate[param][condition].value?
          @_req.assert(param, @_validate[param].message)[condition](@_validate[param][condition].value)
        else
          @_req.assert(param, @_validate[param].message)[condition]()

    return @_res.badRequest(expressValidator.serialize(@_req)) if @_req.validationErrors()
    allParams = {}
    async.each params, (param) =>
      allParams[param] = @_req.param "#{param}"

    cb(allParams)

## -- Exports ------------------------------------------------------------------

exports = module.exports = validateGenerator
