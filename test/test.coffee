## -- Dependencies -----------------------------------------------------------------------

validator = require '..'
should    = require 'should'
req       = {}
res       = {}

## -- Test ------------------------------------------------------------------------------

describe "Validator ::", ->

  it 'add one condition', ->
    value = { id: { notEmpty: { message: 'Model.NotFound', value: undefined } } }
    validator
      .begin(req, res)
      .add 'id', 'Model.NotFound', 'notEmpty'
    validator._validate.should.eql value


  it 'add two conditions', ->
    value = { id: { notEmpty: { message: 'Model.NotFound', value: undefined } }, follower: { notEmpty: { message: 'Model.NotFound', value: undefined } } }
    validator
      .begin(req, res)
      .add 'id', 'Model.NotFound', 'notEmpty'
      .add 'follower', 'Model.NotFound', 'notEmpty'
    validator._validate.should.eql value

   it 'add two conditions in the same param', ->
     value = {id:{notEmpty:{message:'Model.NotFound',value:undefined},minLength:{message:'Model.NotFound',value:undefined}}}
     validator
       .begin(req, res)
       .add 'id', 'Model.NotFound', 'notEmpty'
       .add 'id', 'Model.NotFound', 'minLength'
     validator._validate.should.eql value



