errorify = require 'sailor-errorify'

class validateGenerator

  @begin: (req, res) ->
    @_req = req
    @_res = res
    @_validate = {}
    this

  @add: (param, message, conditions...)->
    @_validate[param] = {} unless @_validate[param]?
    @_validate[param][condition] = message: message for condition in conditions
    this

  @end: (cb) ->
    for param of @_validate
      for condition of @_validate[param]
        entry = @_validate[param][condition]
        @_req.assert(param, entry.message)[condition]()

    if @_req.validationErrors()
      errors = errorify.serialize(@_req)
      return @_res.badRequest(errors)

    cb(@_req.allParams())

module.exports = validateGenerator
