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
            'Should match a name': 'show me space explorer Mike Ditka'
            'Should match case insensitive': 'SHow ME spACE ExpLORer MiKe DiTkA'
            'Should match arbitrary whitespace': 'show   me	space 	  explorer 	Mike    Ditka'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'show me space explorer'
            'Should not match without a name, even with many spaces': 'show me space explorer             '
        names:
            'Should match single name':
                'show me space explorer Mike': 'Mike'
            'Should match double name':
                'show me space explorer Mike Ditka': 'Mike Ditka'
            'should match name of arbitrary length':
                'show me space explorer Michael Keller Ditka': 'Michael Keller Ditka'
                'show me space explorer Michael Keller Ditka (Michael Dyczko)': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'show me space explorer  	   Mike Ditka  	  ': 'Mike Ditka'
    bio:
        match:
            'Should match a name': 'tell me about space explorer Mike Ditka'
            'Should match case insensitive': 'TELl Me aBOut space explorer MiKe DiTKa'
            'Should match arbitrary whitespace': 'tell     me		about	space 	  explorer 	     Mike Ditka'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'tell me about space explorer'
            'Should not match without a name, even with many spaces': 'tell me about space explorer             '
        names:
            'Should match single name':
                'tell me about space explorer Mike': 'Mike'
            'Should match double name':
                'tell me about space explorer Mike Ditka': 'Mike Ditka'
            'should match name of arbitrary length':
                'tell me about space explorer Michael Keller Ditka': 'Michael Keller Ditka'
                'tell me about space explorer Michael Keller Ditka (Michael Dyczko)': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'tell me about space explorer  	   Mike Ditka  	  ': 'Mike Ditka'
    country:
        match:
            'Should match a name': 'where is space explorer Mike Ditka from'
            'Should match case insensitive': 'WHerE IS spACE ExpLORer Mike Ditka fROm'
            'Should match arbitrary whitespace': 'where     is	space 	  explorer			Mike Ditka  	  	 from'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'where is space explorer from'
            'Should not match without a name, even with many spaces': 'where is space explorer        from'
        names:
            'Should match single name':
                'where is space explorer Mike from': 'Mike'
            'Should match double name':
                'where is space explorer Mike Ditka from': 'Mike Ditka'
            'should match name of arbitrary length':
                'where is space explorer Michael Keller Ditka from': 'Michael Keller Ditka'
                'where is space explorer Michael Keller Ditka (Michael Dyczko) from': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'where is space explorer  	   Mike Ditka  	   from': 'Mike Ditka'
    location:
        match:
            'Should match a name': 'where is space explorer Mike Ditka stationed'
            'Should match case insensitive': 'wHeRe IS spACE ExpLORer Mike Ditka sTAtionEd'
            'Should match arbitrary whitespace': 'where     is	space 	  explorer 	  	Mike Ditka	    stationed'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'where is space explorer stationed'
            'Should not match without a name, even with many spaces': 'where is space explorer        stationed'
        names:
            'Should match single name':
                'where is space explorer Mike stationed': 'Mike'
            'Should match double name':
                'where is space explorer Mike Ditka stationed': 'Mike Ditka'
            'should match name of arbitrary length':
                'where is space explorer Michael Keller Ditka stationed': 'Michael Keller Ditka'
                'where is space explorer Michael Keller Ditka (Michael Dyczko) stationed': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'where is space explorer   	  Mike Ditka  	   stationed': 'Mike Ditka'
    time:
        match:
            'Should match a name': 'how long has space explorer Mike Ditka been in space'
            'Should match case insensitive': 'hOW lOnG hAS spACE ExpLORer Mike Ditka beEN in SPaCe'
            'Should match arbitrary whitespace': 'how   long 	 has	space 	 explorer  	Mike Ditka	    been    in	space'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'how long has space explorer been in space'
            'Should not match without a name, even with many spaces': 'how long has space explorer        been in space'
        names:
            'Should match single name':
                'how long has space explorer Mike been in space': 'Mike'
            'Should match double name':
                'how long has space explorer Mike Ditka been in space': 'Mike Ditka'
            'should match name of arbitrary length':
                'how long has space explorer Michael Keller Ditka been in space': 'Michael Keller Ditka'
                'how long has space explorer Michael Keller Ditka (Michael Dyczko) been in space': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'how long has space explorer   	  Mike Ditka  	   been in space': 'Mike Ditka'
    total:
        match:
            'Should match a name': 'how many days has space explorer Mike Ditka spent in space'
            'Should match case insensitive': 'hOW maNY DAys hAS spACE ExpLORer Mike Ditka spENT in SPaCe'
            'Should match arbitrary whitespace': 'how   many  	 days 	 has	space 	 explorer  	Mike Ditka	    spent    in	space'
        noMatch:
            'Should not match gibberish': 'alagkjalgkj alkjf afj '
            'Should not match empty string': ''
            'Should not match without a name': 'how many days has space explorer spent in space'
            'Should not match without a name, even with many spaces': 'how many days has space explorer        spent in space'
        names:
            'Should match single name':
                'how many days has space explorer Mike spent in space': 'Mike'
            'Should match double name':
                'how many days has space explorer Mike Ditka spent in space': 'Mike Ditka'
            'should match name of arbitrary length':
                'how many days has space explorer Michael Keller Ditka spent in space': 'Michael Keller Ditka'
                'how many days has space explorer Michael Keller Ditka (Michael Dyczko) spent in space': 'Michael Keller Ditka (Michael Dyczko)'
            'Should extract a trimmed name from plenty of whitespace':
                'how many days has space explorer   	  Mike Ditka  	   spent in space': 'Mike Ditka'

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
