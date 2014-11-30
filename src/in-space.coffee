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
funcs = require '../lib/funcs'

module.exports = (robot) ->
  ###
     Find out how many people are in space right now.
  ###
  robot.respond regexes.count, funcs.count

  ###
     Find out the names of all the people in space right now.
  ###
  robot.respond regexes.names, funcs.names
      
  ###
     Get a picture of someone who is in space.
  ###
  robot.respond regexes.picture, funcs.picture

  ###
     Get the Biography of a space explorer.
  ###
  robot.respond regexes.bio, funcs.bio

  ###
     Get the country of origin for a person in space.
  ###
  robot.respond regexes.country, funcs.country
      
  ###
     Get the space location of someone who is in space.
  ###
  robot.respond regexes.location, funcs.location
