chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

space_regexes = require '../lib-cov/regexes'
space_functions = require '../lib-cov/funcs'

describe 'in-space', ->
  before ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src-cov/in-space')(@robot)

  for k, v of space_regexes
      it 'registers a respond listener for ' + k, ->
        expect(@robot.respond).to.have.been.calledWith(v, space_functions[k])

