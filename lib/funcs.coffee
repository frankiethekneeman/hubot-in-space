util = require '../lib/util'

module.exports =

  ###
     Find out how many people are in space right now.
  ###
  count: (msg) ->
    util.getData msg, (spaceData) ->
      msg.send "There are #{spaceData.number} people in space right now."

  ###
     Find out the names of all the people in space right now.
  ###
  names: (msg) ->
    util.getData msg, (spaceData) ->
      msg.send "Currently in Space: " + spaceData.people.map((p) -> p.name).join(", ") + "."

  ###
     Get a picture of someone who is in space.
  ###
  picture: (msg) ->
    util.aboutSpaceman msg, msg.match[1], (m)->
      msg.send m.biophoto

  ###
     Get the Biography of a space explorer.
  ###
  bio: (msg) ->
    util.aboutSpaceman msg, msg.match[1], (m) ->
      msg.send m.bio

  ###
     Get the country of origin for a person in space.
  ###
  country: (msg) ->
    util.aboutSpaceman msg, msg.match[1], (m) ->
      msg.send "#{m.countryflag}\n#{m.country}"

  ###
     Get the space location of someone who is in space.
  ###
  location: (msg) ->
    util.aboutSpaceman msg, msg.match[1], (m) ->
      msg.send m.location
