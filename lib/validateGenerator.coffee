errorify = require 'sailor-errorify'

class validateGenerator

  @begin: (req, res) ->
    @_req = req
    @_res = res
    @_validate = {}
    this

  @add: (param, message, condition, value...)->
    @_validate[param] = {} unless @_validate[param]?

    @_validate[param][condition] =
      message : message
      value   : value
    this

  @end: (cb) ->
    for param of @_validate
      for condition of @_validate[param]
        entry = @_validate[param][condition]

        if entry.value.length isnt 0
          fn = @_req.assert(param, entry.message)[condition]
          fn.apply(fn, Array.prototype.slice.call(entry.value))
        else
          @_req.assert(param, entry.message)[condition]()

    if @_req.validationErrors()
      errors = errorify.serialize(@_req)
      return @_res.badRequest(errors)

    cb(@_req.allParams())

module.exports = validateGenerator
