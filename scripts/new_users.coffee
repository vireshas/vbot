module.exports = (robot) ->

  robot.respond /add user (.*) to (.*) /i, (msg) ->
    name = msg.match[1].trim()
    room = msg.match[2].trim()
    user_counter = robot.brain.incr('u_counter')
    u_dict = {'name':name, 'room':room, 'id':user_counter}
    users = robot.brain.users
    data = robot.brain.data
    users = users.push(u_dict)
    return msg.reply "#{name} does not exist" unless user?
    user.roles or= []
    displayRoles = user.roles

    if user.id.toString() in admins
      displayRoles.push('admin')

    if displayRoles.length == 0
      msg.reply "#{name} has no roles."
    else
      msg.reply "#{name} has the following roles: #{displayRoles.join(', ')}."

  robot.respond /who has admin role\?*$/i, (msg) ->
    adminNames = []
    for admin in admins
      user = robot.brain.userForId(admin)
      adminNames.push user.name if user?

    if adminNames.length > 0
      msg.reply "The following people have the 'admin' role: #{adminNames.join(', ')}"
    else
      msg.reply "There are no people that have the 'admin' role."
