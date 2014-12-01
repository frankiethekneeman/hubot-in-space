chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

space_regexes = require '../lib-cov/regexes'
space_functions = require '../lib-cov/funcs'
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

for i, person of fauxSpaceData.people
  tests.picture["show me #{person.name}"] = person.biophoto
  tests.bio["tell me about #{person.name}"] = person.bio
  tests.country["where is #{person.name} from"] = "#{person.countryflag}\n#{person.country}"
  tests.location["where is #{person.name} stationed"] = person.location


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
