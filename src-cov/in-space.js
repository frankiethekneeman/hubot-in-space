if (typeof _$jscoverage === 'undefined') _$jscoverage = {};
if ((typeof global !== 'undefined') && (typeof global._$jscoverage === 'undefined')) {
    global._$jscoverage = _$jscoverage
} else if ((typeof window !== 'undefined') && (typeof window._$jscoverage === 'undefined')) {
    window._$jscoverage = _$jscoverage
}
if (! _$jscoverage["in-space.coffee"]) {
    _$jscoverage["in-space.coffee"] = [];
    _$jscoverage["in-space.coffee"][21] = 0;
    _$jscoverage["in-space.coffee"][22] = 0;
    _$jscoverage["in-space.coffee"][24] = 0;
    _$jscoverage["in-space.coffee"][28] = 0;
    _$jscoverage["in-space.coffee"][33] = 0;
    _$jscoverage["in-space.coffee"][38] = 0;
    _$jscoverage["in-space.coffee"][43] = 0;
    _$jscoverage["in-space.coffee"][48] = 0;
    _$jscoverage["in-space.coffee"][53] = 0;
}

_$jscoverage["in-space.coffee"].source = ["# Description:", "#   learn about all the people in space!", "#", "# Dependencies:", "#   None", "#", "# Configuration:", "#   None", "#", "# Commands:", "#   hubot how many people are in space right now - find out how many people are in space", "#   hubot who is in space right now - find out the names of people who are in space", "#   hubot show me (name) - See the face of someone who is in space _right now_", "#   hubot tell me about (name) - See the bio of someone who is in space _right now_", "#   hubot where is (name) from - Find out which country sent that person into space.", "#   hubot where is (name) stationed - Find out where that person is in space.", "#", "# Author:", "#   Francis Van Wetering", "", "regexes = require '../lib-cov/regexes'", "funcs = require '../lib/funcs'", "", "module.exports = (robot) ->", "  ###", "     Find out how many people are in space right now.", "  ###", "  robot.respond regexes.count, funcs.count", "", "  ###", "     Find out the names of all the people in space right now.", "  ###", "  robot.respond regexes.names, funcs.names", "      ", "  ###", "     Get a picture of someone who is in space.", "  ###", "  robot.respond regexes.picture, funcs.picture", "", "  ###", "     Get the Biography of a space explorer.", "  ###", "  robot.respond regexes.bio, funcs.bio", "", "  ###", "     Get the country of origin for a person in space.", "  ###", "  robot.respond regexes.country, funcs.country", "      ", "  ###", "     Get the space location of someone who is in space.", "  ###", "  robot.respond regexes.location, funcs.location", ""];

(function() {
  var funcs, regexes;

  _$jscoverage["in-space.coffee"][21]++;

  regexes = require('../lib-cov/regexes');

  _$jscoverage["in-space.coffee"][22]++;

  funcs = require('../lib-cov/funcs');

  _$jscoverage["in-space.coffee"][24]++;

  module.exports = function(robot) {

    /*
       Find out how many people are in space right now.
     */
    _$jscoverage["in-space.coffee"][28]++;
    robot.respond(regexes.count, funcs.count);

    /*
       Find out the names of all the people in space right now.
     */
    _$jscoverage["in-space.coffee"][33]++;
    robot.respond(regexes.names, funcs.names);

    /*
       Get a picture of someone who is in space.
     */
    _$jscoverage["in-space.coffee"][38]++;
    robot.respond(regexes.picture, funcs.picture);

    /*
       Get the Biography of a space explorer.
     */
    _$jscoverage["in-space.coffee"][43]++;
    robot.respond(regexes.bio, funcs.bio);

    /*
       Get the country of origin for a person in space.
     */
    _$jscoverage["in-space.coffee"][48]++;
    robot.respond(regexes.country, funcs.country);

    /*
       Get the space location of someone who is in space.
     */
    _$jscoverage["in-space.coffee"][53]++;
    return robot.respond(regexes.location, funcs.location);
  };

}).call(this);
