chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

space_utils = require '../lib-cov/util'
fauxSpaceData = require './mockData/fauxSpaceData'

shouldNotFind = [
    "Mike Ditka"
    "Vince Lombardi"
    "Tom Osborne"
    "Tom Landry"
]

randomCase = (string) ->
  newString =  ''
  for i in [0..string.length]
    ch = string.charAt(i)
    if Math.random() > 0.5
      newString += ch.toUpperCase()
    else 
      newString += ch.toLowerCase()
  newString

describe 'Utilities', ->
  describe 'findSpaceman', ->
    for i, p of fauxSpaceData.people
      do (person = p) ->
        it 'Should Find ' + person.name, ->
          expect(space_utils.findSpaceman(fauxSpaceData, person.name)).to.eql(person)
        it 'Should Find ' + person.name.toUpperCase(), ->
          expect(space_utils.findSpaceman(fauxSpaceData, person.name.toUpperCase())).to.eql(person)
        it 'Should Find ' + person.name.toLowerCase(), ->
          expect(space_utils.findSpaceman(fauxSpaceData, person.name.toLowerCase())).to.eql(person)
        casedName = randomCase(person.name)
        it 'Should Find ' + casedName, ->
          expect(space_utils.findSpaceman(fauxSpaceData, casedName)).to.eql(person)
    for i, p of shouldNotFind
      do (person = p) ->
        it 'Should Not Find ' + person, ->
          expect(space_utils.findSpaceman(fauxSpaceData, person)).to.be.null

  describe 'aboutSpaceman', ->
    beforeEach ->
      @fauxMessage = require('./mockData/fauxMessage')()
    space_utils.spaceData = fauxSpaceData
    for i, p of fauxSpaceData.people
      do (person = p) ->
        it 'Should Find ' + person.name, (done)->
          space_utils.aboutSpaceman @fauxMessage, person.name, (fauxSpaceman)->
            expect(fauxSpaceman).to.eql(person)
            done()
        it 'Should Find ' + person.name.toUpperCase(), (done)->
          space_utils.aboutSpaceman @fauxMessage, person.name.toUpperCase(), (fauxSpaceman)->
            expect(fauxSpaceman).to.eql(person)
            done()
        it 'Should Find ' + person.name.toLowerCase(), (done)->
          space_utils.aboutSpaceman @fauxMessage, person.name.toLowerCase(), (fauxSpaceman)->
            expect(fauxSpaceman).to.eql(person)
            done()
        casedName = randomCase(person.name)
        it 'Should Find ' + casedName, (done)->
          space_utils.aboutSpaceman @fauxMessage, casedName, (fauxSpaceman)->
            expect(fauxSpaceman).to.eql(person)
            done()
    for i, p of shouldNotFind
      do (person = p) ->
        it 'Should Not Find ' + person, (done)->
          @fauxMessage.send = (param) ->
            expect(param).to.be.eql("I'm sorry, there's no one in space by that name!")
            done()
          space_utils.aboutSpaceman @fauxMessage, person, (fauxSpaceman)->
            chai.assert.fail("", "", "Expected This not to be called.  Found:" + JSON.stringify(fauxSpaceman, null, '       '))
            done()

  describe 'getData', ->
    beforeEach ->
      @fauxMessage = require('./mockData/fauxMessage')()
      @utils = require '../lib/util'

    it 'Should go to the network if no local data exists.', (done) ->
      fm = @fauxMessage
      @utils.spaceData = null
      @utils.getData fm, (spaceData) ->
        expect(fm.http).to.have.been.calledWith("http://www.howmanypeopleareinspacerightnow.com/peopleinspace.json")
        expect(fm.http().get).to.have.been.called
        done()

    it 'Should not go to the network if local data exists.', (done) ->
      fm = @fauxMessage
      @utils.spaceData = fauxSpaceData
      @utils.getData fm, (spaceData) ->
        expect(fm.http).not.to.have.been.called
        expect(fm.http().get).not.to.have.been.called
        done()

    it 'Should Call All Callbacks previously Registered during network traffic.', (done) ->
      callback = sinon.spy()
      @utils.callbacks.push callback
      @utils.spaceData = null
      utils = @utils
      @utils.getData @fauxMessage, (spaceData) ->
        expect(callback).to.have.been.calledWith(spaceData)
        setTimeout( ->
            expect(utils.callbacks.length).to.equal(0)
            done()
        , 0)
