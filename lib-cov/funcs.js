if (typeof _$jscoverage === 'undefined') _$jscoverage = {};
if ((typeof global !== 'undefined') && (typeof global._$jscoverage === 'undefined')) {
    global._$jscoverage = _$jscoverage
} else if ((typeof window !== 'undefined') && (typeof window._$jscoverage === 'undefined')) {
    window._$jscoverage = _$jscoverage
}
if (! _$jscoverage["funcs.coffee"]) {
    _$jscoverage["funcs.coffee"] = [];
    _$jscoverage["funcs.coffee"][1] = 0;
    _$jscoverage["funcs.coffee"][3] = 0;
    _$jscoverage["funcs.coffee"][9] = 0;
    _$jscoverage["funcs.coffee"][10] = 0;
    _$jscoverage["funcs.coffee"][16] = 0;
    _$jscoverage["funcs.coffee"][17] = 0;
    _$jscoverage["funcs.coffee"][23] = 0;
    _$jscoverage["funcs.coffee"][24] = 0;
    _$jscoverage["funcs.coffee"][30] = 0;
    _$jscoverage["funcs.coffee"][31] = 0;
    _$jscoverage["funcs.coffee"][37] = 0;
    _$jscoverage["funcs.coffee"][38] = 0;
    _$jscoverage["funcs.coffee"][44] = 0;
    _$jscoverage["funcs.coffee"][45] = 0;
}

_$jscoverage["funcs.coffee"].source = ["util = require '../lib-cov/util'", "", "module.exports =", "", "  ###", "     Find out how many people are in space right now.", "  ###", "  count: (msg) ->", "    util.getData msg, (spaceData) ->", "      msg.send \"There are #{spaceData.number} people in space right now.\"", "", "  ###", "     Find out the names of all the people in space right now.", "  ###", "  names: (msg) ->", "    util.getData msg, (spaceData) ->", "      msg.send \"Currently in Space: \" + spaceData.people.map((p) -> p.name).join(\", \") + \".\"", "", "  ###", "     Get a picture of someone who is in space.", "  ###", "  picture: (msg) ->", "    util.aboutSpaceman msg, msg.match[1], (m)->", "      msg.send m.biophoto", "", "  ###", "     Get the Biography of a space explorer.", "  ###", "  bio: (msg) ->", "    util.aboutSpaceman msg, msg.match[1], (m) ->", "      msg.send m.bio", "", "  ###", "     Get the country of origin for a person in space.", "  ###", "  country: (msg) ->", "    util.aboutSpaceman msg, msg.match[1], (m) ->", "      msg.send \"#{m.countryflag}\\n#{m.country}\"", "", "  ###", "     Get the space location of someone who is in space.", "  ###", "  location: (msg) ->", "    util.aboutSpaceman msg, msg.match[1], (m) ->", "      msg.send m.location", ""];

(function() {
  var util;

  _$jscoverage["funcs.coffee"][1]++;

  util = require('../lib-cov/util');

  _$jscoverage["funcs.coffee"][3]++;

  module.exports = {

    /*
       Find out how many people are in space right now.
     */
    count: function(msg) {
      _$jscoverage["funcs.coffee"][9]++;
      return util.getData(msg, function(spaceData) {
        _$jscoverage["funcs.coffee"][10]++;
        return msg.send("There are " + spaceData.number + " people in space right now.");
      });
    },

    /*
       Find out the names of all the people in space right now.
     */
    names: function(msg) {
      _$jscoverage["funcs.coffee"][16]++;
      return util.getData(msg, function(spaceData) {
        _$jscoverage["funcs.coffee"][17]++;
        return msg.send("Currently in Space: " + spaceData.people.map(function(p) {
          return p.name;
        }).join(", ") + ".");
      });
    },

    /*
       Get a picture of someone who is in space.
     */
    picture: function(msg) {
      _$jscoverage["funcs.coffee"][23]++;
      return util.aboutSpaceman(msg, msg.match[1], function(m) {
        _$jscoverage["funcs.coffee"][24]++;
        return msg.send(m.biophoto);
      });
    },

    /*
       Get the Biography of a space explorer.
     */
    bio: function(msg) {
      _$jscoverage["funcs.coffee"][30]++;
      return util.aboutSpaceman(msg, msg.match[1], function(m) {
        _$jscoverage["funcs.coffee"][31]++;
        return msg.send(m.bio);
      });
    },

    /*
       Get the country of origin for a person in space.
     */
    country: function(msg) {
      _$jscoverage["funcs.coffee"][37]++;
      return util.aboutSpaceman(msg, msg.match[1], function(m) {
        _$jscoverage["funcs.coffee"][38]++;
        return msg.send("" + m.countryflag + "\n" + m.country);
      });
    },

    /*
       Get the space location of someone who is in space.
     */
    location: function(msg) {
      _$jscoverage["funcs.coffee"][44]++;
      return util.aboutSpaceman(msg, msg.match[1], function(m) {
        _$jscoverage["funcs.coffee"][45]++;
        return msg.send(m.location);
      });
    }
  };

}).call(this);
