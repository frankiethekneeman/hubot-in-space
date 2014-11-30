module.exports = 
    ###
       The latest copy of the information on people in space.
    ###
    spaceData : null

    ###
       State Variable to prevent multiple calls to the "api".
       
       This looks like bad code, but since javascript is single threaded on an event loop, it is essentially a mutex.
    ###
    calling : false

    ###
       All the waiting threads that need to be notified when the "api" returns.
    ###
    callbacks : []

    ###
       The time, in milliseconds, to maintain the cached data about people in space.
    ###
    cacheTime : 60000

    ###
       Convenience method to wrap "api" access with cache information.
       
       If the cached data is non falsey, the callback will be called immediately, otherwise, it will be added to the
       list of callbacks waiting on the "api."  If the "api" is not already being called, it will initialize the call.
       
       @param msg I need the message so I can use the HTTP method.  Imperfect, but easier than relying on Node's HTTP module.
       @param callback the callable to call upon the return of the information.  Called with two arguments:  the first
        is the data returned from the "api", the second is the message object.
    ###

    getData : (msg, callback) ->
      if this.spaceData
        callback this.spaceData
      else
        this.callbacks.push(callback)
        if !this.calling
          this.calling = true
          _this = this
          msg.http("http://www.howmanypeopleareinspacerightnow.com/peopleinspace.json")
            .get() (err, res, body) ->
              _this.calling = false
              _this.spaceData = JSON.parse(body)
              cb(_this.spaceData) for cb in _this.callbacks
              _this.callbacks = []
              setTimeout(->
                _this.spaceData = null
                return
              , _this.cacheTime)

    ###
       Iterate through the list of space people and find the one matching the name passed.  Return the information on that space
       person, or null if none is found.   Search is case insensitive.
       
       @param data the information from the "api" about all the people in space.
       @param name the name you're looking for.
       @return information about that person, or null, if that person is not in space.
    ###
    findSpaceman : (data, name) ->
      n = name.toUpperCase()
      for spaceman in data.people
        if spaceman.name.toUpperCase() == n
          return spaceman
      return null

    ###
       Convenience method wrapping the API access model and the spaceman search function.
       
       @param msg I need the message so I can use the HTTP method.  Imperfect, but easier than relying on Node's HTTP module.
       @param name the name of the space person whose information you're seeking.
       @param callback the callable to call upon the return of the information.  Called with two arguments:  the first
        is the data returned from the "api" about the person searched for, the second is the message object.
    ###
    aboutSpaceman : (msg, name, cb) ->
        _this = this
        this.getData msg, (spaceData) ->
          f = _this.findSpaceman spaceData, name
          if f
            cb f
          else
            msg.send "I'm sorry, there's no one in space by that name!"

