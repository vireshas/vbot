# Description:
#   Few set of commands to add and delete users
#
# Commands:
#   hubot add user viresh to admin
#

module.exports = (robot) ->

  robot.respond /add new user (.*) to (.*)/i, (msg) ->
    name = msg.match[1].trim()
    role = msg.match[2].trim()
    user = robot.brain.users

    msg.send name
    msg.send role
    msg.send user

