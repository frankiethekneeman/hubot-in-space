sinon = require 'sinon'

module.exports = () ->
  http: sinon.stub().returns {
    get: sinon.stub().returns (cb)->
      cb(null, null, JSON.stringify(require('./fauxSpaceData')))
  }
  send: sinon.spy()
