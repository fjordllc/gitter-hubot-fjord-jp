# Description:
#   A simple interaction with the built in HTTP Daemon
#
# Commands:
#   None
#
# URLS:
#   /httpd-echo

url = require('url')
querystring = require('querystring')

module.exports = (robot) ->
  robot.router.get '/httpd-echo', (req, res) ->
    query = querystring.parse(url.parse(req.url).query)
    user =
      room:
        id: query.room
      message: 'rrrrrrrrrrrr'

    console.log query
    console.log user

    try
      robot.send user, "INCOMING MESSAGE: " + query.message
      res.end "message sent: #{query.message}"
    catch error
      console.log "message-listner error: #{error}."
