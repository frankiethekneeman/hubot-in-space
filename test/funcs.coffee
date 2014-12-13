chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

space_regexes = require '../lib/regexes'
space_functions = require '../lib/funcs'
fauxSpaceData = require './mockData/fauxSpaceData'

tests = 
  count: 
    'how many people are in space': 'There are 6 people in space right now.'
  names: 
    "who is in space": "Currently in Space: Barry Willmore, Elena Serova, Alexander Samokutyaev, Terry Virts, Samantha Cristoforetti, Anton Shkaplerov."
  picture: {}
  bio: {}
  country: {}
  location: {}
  time: {}
  total: {}

for i, person of fauxSpaceData.people
  tests.picture["show me space explorer #{person.name}"] = person.biophoto
  tests.bio["tell me about space explorer #{person.name}"] = person.bio
  tests.country["where is space explorer #{person.name} from"] = "#{person.countryflag}\n#{person.country}"
  tests.location["where is space explorer #{person.name} stationed"] = person.location
  tests.time["how long has space explorer #{person.name} been in space"] = person.daysinspace + " days"
  tests.total["how many days has space explorer #{person.name} spent in space"] = person.daysinspace + person.careerdays


describe "Functions", ->
  beforeEach ->
    @fauxMessage = require('./mockData/fauxMessage')()
  for n, c of tests
    do(name = n, cases = c) ->
      describe n, ->
        for t, r of cases
          do (text = t, response = r) ->
            it "Should respond to: \"#{text}\"", ->
              fm = @fauxMessage
              fm.match = space_regexes[name].exec(text)
              space_functions[name] fm
              expect(fm.send).to.have.been.calledWith(response)
