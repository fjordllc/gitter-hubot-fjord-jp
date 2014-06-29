# Description:
#   A simple interaction with the built in HTTP Daemon
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLS:
#   /hubot/version

module.exports = (robot) ->
  DEFAULT_ROOM    = process.env['HUBOT_DEFALUT_ROOM'] or 'Default'
  DEFAULT_USER_ID = process.env['HUBOT_DEFAULT_USER_ID'] or -1

  msg = new robot.Response robot, {
    user:
      id: DEFAULT_USER_ID
      name: DEFAULT_ROOM
      room: DEFAULT_ROOM
    id: 'messageId'
    text: ''
    done: false
    room: DEFAULT_ROOM
  }

  robot.router.get '/hubot/internd', (req, res) ->
    msg.send req.query.text
    res.writeHead 200
    res.write 'success'
    res.end()
