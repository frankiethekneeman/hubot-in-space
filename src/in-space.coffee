# Description:
#   learn about all the people in space!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot how many people are in space right now - find out how many people are in space
#   hubot who is in space right now - find out the names of people who are in space
#   hubot show me (name) - See the face of someone who is in space _right now_
#   hubot tell me about (name) - See the bio of someone who is in space _right now_
#   hubot where is (name) from - Find out which country sent that person into space.
#   hubot where is (name) stationed - Find out where that person is in space.
#
# Author:
#   Francis Van Wetering

regexes = require '../lib/regexes'

###
   The latest copy of the information on people in space.
###
spaceData = null

###
   State Variable to prevent multiple calls to the "api".
   
   This looks like bad code, but since javascript is single threaded on an event loop, it is essentially a mutex.
###
calling = false

###
   All the waiting threads that need to be notified when the "api" returns.
###
callbacks = []

###
   The time, in milliseconds, to maintain the cached data about people in space.
###
cacheTime = 60000

###
   Convenience method to wrap "api" access with cache information.
   
   If the cached data is non falsey, the callback will be called immediately, otherwise, it will be added to the
   list of callbacks waiting on the "api."  If the "api" is not already being called, it will initialize the call.
   
   @param msg I need the message so I can use the HTTP method.  Imperfect, but easier than relying on Node's HTTP module.
   @param callback the callable to call upon the return of the information.  Called with two arguments:  the first
    is the data returned from the "api", the second is the message object.
###

getData = (msg, callback) ->
  if spaceData
    callback spaceData
  else
    callbacks.push(callback)
    if !calling
      calling = true
      msg.http("http://www.howmanypeopleareinspacerightnow.com/peopleinspace.json")
        .get() (err, res, body) ->
          console.log "HTTP RESPONSE"
          calling = false
          spaceData = JSON.parse(body)
          cb(spaceData, msg) for cb in callbacks
          callbacks = []
          setTimeout(->
            spaceData = null
            return
          , cacheTime)

###
   Iterate through the list of space people and find the one matching the name passed.  Return the information on that space
   person, or null if none is found.   Search is case insensitive.
   
   @param data the information from the "api" about all the people in space.
   @param name the name you're looking for.
   @return information about that person, or null, if that person is not in space.
###
findSpaceman = (data, name) ->
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
aboutSpaceman = (msg, name, cb) ->
    getData msg, (spaceData, m) ->
      f = findSpaceman spaceData, name
      if f
        cb f, m
      else
        msg.send "I'm sorry, there's noone in space by that name!"

module.exports = (robot) ->
  ###
     Find out how many people are in space right now.
  ###
  robot.respond regexes.count, (msg) ->
    getData msg, (spaceData) ->
      msg.send "There are #{spaceData.number} people in space right now."

  ###
     Find out the names of all the people in space right now.
  ###
  robot.respond regexes.names, (msg) ->
    getData msg, (spaceData) ->
      msg.send "Currently in Space: " + spaceData.people.map((p) -> p.name).join(", ") + "."
      
  ###
     Get a picture of someone who is in space.
  ###
  robot.respond regexes.picture, (msg) ->
    aboutSpaceman msg, msg.match[1], (m)->
      msg.send m.biophoto

  ###
     Get the Biography of a space explorer.
  ###
  robot.respond regexes.bio, (msg) ->
    aboutSpaceman msg, msg.match[1], (m) ->
      msg.send m.bio

  ###
     Get the country of origin for a person in space.
  ###
  robot.respond regexes.country, (msg) ->
    aboutSpaceman msg, msg.match[1], (m) ->
      msg.send "#{m.countryflag}\n#{m.country}"
      
  ###
     Get the space location of someone who is in space.
  ###
  robot.respond regexes.location, (msg) ->
    aboutSpaceman msg, msg.match[1], (m) ->
      msg.send m.location


