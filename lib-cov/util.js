if (typeof _$jscoverage === 'undefined') _$jscoverage = {};
if ((typeof global !== 'undefined') && (typeof global._$jscoverage === 'undefined')) {
    global._$jscoverage = _$jscoverage
} else if ((typeof window !== 'undefined') && (typeof window._$jscoverage === 'undefined')) {
    window._$jscoverage = _$jscoverage
}
if (! _$jscoverage["util.coffee"]) {
    _$jscoverage["util.coffee"] = [];
    _$jscoverage["util.coffee"][1] = 0;
    _$jscoverage["util.coffee"][36] = 0;
    _$jscoverage["util.coffee"][37] = 0;
    _$jscoverage["util.coffee"][39] = 0;
    _$jscoverage["util.coffee"][40] = 0;
    _$jscoverage["util.coffee"][41] = 0;
    _$jscoverage["util.coffee"][42] = 0;
    _$jscoverage["util.coffee"][43] = 0;
    _$jscoverage["util.coffee"][45] = 0;
    _$jscoverage["util.coffee"][46] = 0;
    _$jscoverage["util.coffee"][47] = 0;
    _$jscoverage["util.coffee"][48] = 0;
    _$jscoverage["util.coffee"][49] = 0;
    _$jscoverage["util.coffee"][50] = 0;
    _$jscoverage["util.coffee"][51] = 0;
    _$jscoverage["util.coffee"][63] = 0;
    _$jscoverage["util.coffee"][64] = 0;
    _$jscoverage["util.coffee"][65] = 0;
    _$jscoverage["util.coffee"][66] = 0;
    _$jscoverage["util.coffee"][67] = 0;
    _$jscoverage["util.coffee"][78] = 0;
    _$jscoverage["util.coffee"][79] = 0;
    _$jscoverage["util.coffee"][80] = 0;
    _$jscoverage["util.coffee"][81] = 0;
    _$jscoverage["util.coffee"][82] = 0;
    _$jscoverage["util.coffee"][84] = 0;
}

_$jscoverage["util.coffee"].source = ["module.exports = ", "    ###", "       The latest copy of the information on people in space.", "    ###", "    spaceData : null", "", "    ###", "       State Variable to prevent multiple calls to the \"api\".", "       ", "       This looks like bad code, but since javascript is single threaded on an event loop, it is essentially a mutex.", "    ###", "    calling : false", "", "    ###", "       All the waiting threads that need to be notified when the \"api\" returns.", "    ###", "    callbacks : []", "", "    ###", "       The time, in milliseconds, to maintain the cached data about people in space.", "    ###", "    cacheTime : 60000", "", "    ###", "       Convenience method to wrap \"api\" access with cache information.", "       ", "       If the cached data is non falsey, the callback will be called immediately, otherwise, it will be added to the", "       list of callbacks waiting on the \"api.\"  If the \"api\" is not already being called, it will initialize the call.", "       ", "       @param msg I need the message so I can use the HTTP method.  Imperfect, but easier than relying on Node's HTTP module.", "       @param callback the callable to call upon the return of the information.  Called with two arguments:  the first", "        is the data returned from the \"api\", the second is the message object.", "    ###", "", "    getData : (msg, callback) ->", "      if this.spaceData", "        callback this.spaceData", "      else", "        this.callbacks.push(callback)", "        if !this.calling", "          this.calling = true", "          _this = this", "          msg.http(\"http://www.howmanypeopleareinspacerightnow.com/peopleinspace.json\")", "            .get() (err, res, body) ->", "              _this.calling = false", "              _this.spaceData = JSON.parse(body)", "              cb(_this.spaceData) for cb in _this.callbacks", "              _this.callbacks = []", "              setTimeout(->", "                _this.spaceData = null", "                return", "              , _this.cacheTime)", "", "    ###", "       Iterate through the list of space people and find the one matching the name passed.  Return the information on that space", "       person, or null if none is found.   Search is case insensitive.", "       ", "       @param data the information from the \"api\" about all the people in space.", "       @param name the name you're looking for.", "       @return information about that person, or null, if that person is not in space.", "    ###", "    findSpaceman : (data, name) ->", "      n = name.toUpperCase()", "      for spaceman in data.people", "        if spaceman.name.toUpperCase() == n", "          return spaceman", "      return null", "", "    ###", "       Convenience method wrapping the API access model and the spaceman search function.", "       ", "       @param msg I need the message so I can use the HTTP method.  Imperfect, but easier than relying on Node's HTTP module.", "       @param name the name of the space person whose information you're seeking.", "       @param callback the callable to call upon the return of the information.  Called with two arguments:  the first", "        is the data returned from the \"api\" about the person searched for, the second is the message object.", "    ###", "    aboutSpaceman : (msg, name, cb) ->", "        _this = this", "        this.getData msg, (spaceData) ->", "          f = _this.findSpaceman spaceData, name", "          if f", "            cb f", "          else", "            msg.send \"I'm sorry, there's no one in space by that name!\"", "", ""];

(function() {
  _$jscoverage["util.coffee"][1]++;

  module.exports = {

    /*
       The latest copy of the information on people in space.
     */
    spaceData: null,

    /*
       State Variable to prevent multiple calls to the "api".
       
       This looks like bad code, but since javascript is single threaded on an event loop, it is essentially a mutex.
     */
    calling: false,

    /*
       All the waiting threads that need to be notified when the "api" returns.
     */
    callbacks: [],

    /*
       The time, in milliseconds, to maintain the cached data about people in space.
     */
    cacheTime: 60000,

    /*
       Convenience method to wrap "api" access with cache information.
       
       If the cached data is non falsey, the callback will be called immediately, otherwise, it will be added to the
       list of callbacks waiting on the "api."  If the "api" is not already being called, it will initialize the call.
       
       @param msg I need the message so I can use the HTTP method.  Imperfect, but easier than relying on Node's HTTP module.
       @param callback the callable to call upon the return of the information.  Called with two arguments:  the first
        is the data returned from the "api", the second is the message object.
     */
    getData: function(msg, callback) {
      var _this;
      _$jscoverage["util.coffee"][36]++;
      if (this.spaceData) {
        _$jscoverage["util.coffee"][37]++;
        return callback(this.spaceData);
      } else {
        _$jscoverage["util.coffee"][39]++;
        this.callbacks.push(callback);
        _$jscoverage["util.coffee"][40]++;
        if (!this.calling) {
          _$jscoverage["util.coffee"][41]++;
          this.calling = true;
          _$jscoverage["util.coffee"][42]++;
          _this = this;
          _$jscoverage["util.coffee"][43]++;
          return msg.http("http://www.howmanypeopleareinspacerightnow.com/peopleinspace.json").get()(function(err, res, body) {
            var cb, _i, _len, _ref;
            _$jscoverage["util.coffee"][45]++;
            _this.calling = false;
            _$jscoverage["util.coffee"][46]++;
            _this.spaceData = JSON.parse(body);
            _$jscoverage["util.coffee"][47]++;
            _ref = _this.callbacks;
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              cb = _ref[_i];
              cb(_this.spaceData);
            }
            _$jscoverage["util.coffee"][48]++;
            _this.callbacks = [];
            _$jscoverage["util.coffee"][49]++;
            return setTimeout(function() {
              _$jscoverage["util.coffee"][50]++;
              _this.spaceData = null;
              _$jscoverage["util.coffee"][51]++;
            }, _this.cacheTime);
          });
        }
      }
    },

    /*
       Iterate through the list of space people and find the one matching the name passed.  Return the information on that space
       person, or null if none is found.   Search is case insensitive.
       
       @param data the information from the "api" about all the people in space.
       @param name the name you're looking for.
       @return information about that person, or null, if that person is not in space.
     */
    findSpaceman: function(data, name) {
      var n, spaceman, _i, _len, _ref;
      _$jscoverage["util.coffee"][63]++;
      n = name.toUpperCase();
      _$jscoverage["util.coffee"][64]++;
      _ref = data.people;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        spaceman = _ref[_i];
        _$jscoverage["util.coffee"][65]++;
        if (spaceman.name.toUpperCase() === n) {
          _$jscoverage["util.coffee"][66]++;
          return spaceman;
        }
      }
      _$jscoverage["util.coffee"][67]++;
      return null;
    },

    /*
       Convenience method wrapping the API access model and the spaceman search function.
       
       @param msg I need the message so I can use the HTTP method.  Imperfect, but easier than relying on Node's HTTP module.
       @param name the name of the space person whose information you're seeking.
       @param callback the callable to call upon the return of the information.  Called with two arguments:  the first
        is the data returned from the "api" about the person searched for, the second is the message object.
     */
    aboutSpaceman: function(msg, name, cb) {
      var _this;
      _$jscoverage["util.coffee"][78]++;
      _this = this;
      _$jscoverage["util.coffee"][79]++;
      return this.getData(msg, function(spaceData) {
        var f;
        _$jscoverage["util.coffee"][80]++;
        f = _this.findSpaceman(spaceData, name);
        _$jscoverage["util.coffee"][81]++;
        if (f) {
          _$jscoverage["util.coffee"][82]++;
          return cb(f);
        } else {
          _$jscoverage["util.coffee"][84]++;
          return msg.send("I'm sorry, there's no one in space by that name!");
        }
      });
    }
  };

}).call(this);
