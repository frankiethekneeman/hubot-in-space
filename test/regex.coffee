chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

space_regexes = require '../lib/regexes'

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
        names: {}
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
        names: {}
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
        names:
            'Should match single name':
                'show me Mike': 'Mike'
            'Should match double name':
                'show me Mike Ditka': 'Mike Ditka'
            'should match name of arbitrary length':
                'show me Michael Keller Ditka': 'Michael Keller Ditka'
                'show me Michael Keller Ditka (Michael Dyczko)': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'show me  	   Mike Ditka  	  ': 'Mike Ditka'
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
        names:
            'Should match single name':
                'tell me about Mike': 'Mike'
            'Should match double name':
                'tell me about Mike Ditka': 'Mike Ditka'
            'should match name of arbitrary length':
                'tell me about Michael Keller Ditka': 'Michael Keller Ditka'
                'tell me about Michael Keller Ditka (Michael Dyczko)': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'tell me about  	   Mike Ditka  	  ': 'Mike Ditka'
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
        names:
            'Should match single name':
                'where is Mike from': 'Mike'
            'Should match double name':
                'where is Mike Ditka from': 'Mike Ditka'
            'should match name of arbitrary length':
                'where is Michael Keller Ditka from': 'Michael Keller Ditka'
                'where is Michael Keller Ditka (Michael Dyczko) from': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'where is  	   Mike Ditka  	   from': 'Mike Ditka'
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
        names:
            'Should match single name':
                'where is Mike stationed': 'Mike'
            'Should match double name':
                'where is Mike Ditka stationed': 'Mike Ditka'
            'should match name of arbitrary length':
                'where is Michael Keller Ditka stationed': 'Michael Keller Ditka'
                'where is Michael Keller Ditka (Michael Dyczko) stationed': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'where is   	  Mike Ditka  	   stationed': 'Mike Ditka'

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
                for l, t of cases.names
                    do (label = l, tests = t)->
                        it label, ->
                            for string, match of tests
                                expect(space_regexes[name].test(string)).to.be.true
                                expect(space_regexes[name].exec(string)[1]).to.eql(match)
