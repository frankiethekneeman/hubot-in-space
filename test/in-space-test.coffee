chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

space_regexes = require '../lib/regexes'
space_functions = require '../lib/funcs'

describe 'in-space', ->
  before ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/in-space')(@robot)

  for k, v of space_regexes
      it 'registers a respond listener for ' + k, ->
        expect(@robot.respond).to.have.been.calledWith(v, space_functions[k])

