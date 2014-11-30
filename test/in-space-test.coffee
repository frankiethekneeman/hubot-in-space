chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

space_regexes = require '../lib/regexes'

describe 'in-space', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/in-space')(@robot)

  for k, v of space_regexes
      it 'registers a respond listener for ' + k, ->
        expect(@robot.respond).to.have.been.calledWith(v)

regexTests = 
    count:
        match:
            'Should match people': 'how many people are in space right now'
            'Should match folks': 'how many folks are in space right now'
            'Should match explorers': 'how many explorers are in space right now'
            'Should match adventurers': 'how many adventurers are in space right now'
            'Should match without right now': 'how many people are in space'
            'Should match case insensitive': 'HoW MaNy PeOpLe ARE in SPACE RIGHT NOW'
            'Should match arbitrary whitespace': 'how        many            people	are	in 	 	 	space right now'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
    names:
        match:
            'Should match two words': 'who is in space right now'
            'Should match contraction': 'who\'s in space right now'
            'Should match without right now': 'who is in space'
            'Should match case insensitive': 'WHo iS in SPACE RiGhT nOw'
            'Should match arbitrary whitespace': 'who     is 	    	in		space right now'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
    picture:
        match:
            'Should match a name': 'show me Mike Ditka'
            'Should match case insensitive': 'SHow ME MiKe DiTkA'
            'Should match arbitrary whitespace': 'show   me		Mike    Ditka'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'show me'
            'Should not match without a name, even with many spaces': 'show me             '
    bio:
        match:
            'Should match a name': 'tell me about Mike Ditka'
            'Should match case insensitive': 'TELl Me aBOut MiKe DiTKa'
            'Should match arbitrary whitespace': 'tell     me		about 	     Mike Ditka'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'tell me about'
            'Should not match without a name, even with many spaces': 'tell me about             '
    country:
        match:
            'Should match a name': 'where is Mike Ditka from'
            'Should match case insensitive': 'WHerE IS Mike Ditka fROm'
            'Should match arbitrary whitespace': 'where     is			Mike Ditka  	  	 from'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'where is from'
            'Should not match without a name, even with many spaces': 'where is        from'
    location:
        match:
            'Should match a name': 'where is Mike Ditka stationed'
            'Should match case insensitive': 'wHeRe IS Mike Ditka sTAtionEd'
            'Should match arbitrary whitespace': 'where     is 	  	Mike Ditka	    stationed'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'where is stationed'
            'Should not match without a name, even with many spaces': 'where is        stationed'

describe 'Regular Expressions', ->
    for n, c of regexTests
        do (name = n, cases = c)->
            describe name, ->
                for t, s of cases.match
                    do (test = t, string = s) ->
                        it test, ->
                            expect(space_regexes[name].test(string)).to.be.true
                for t, s of cases.noMatch
                    do (test = t, string = s) ->
                        it test, ->
                            expect(space_regexes[name].test(string)).to.be.false
