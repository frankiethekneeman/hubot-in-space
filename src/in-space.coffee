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
#   hubot show me space explorer (name) - See the face of someone who is in space _right now_
#   hubot tell me about space explorer (name) - See the bio of someone who is in space _right now_
#   hubot where is space explorer (name) from - Find out which country sent that person into space.
#   hubot where is space explorer (name) stationed - Find out where that person is in space.
#   hubot how long has space explorer (name) been in space - Find out how many days that person has been in space on their current mission.
#   hubot how many days has space explorer (name) spent in space - Find out how many days that person has spent in space over their career.
#
# Author:
#   Francis Van Wetering

regexes = require '../lib/regexes'
funcs = require '../lib/funcs'

module.exports = (robot) ->
  for k, v of regexes
    if funcs[k]
        robot.respond v, funcs[k]
