# Description:
#   A simple interaction with the built in HTTP Daemon
#
# Commands:
#   None
#
# URLS:
#   /hubot/httpd-echo

url = require('url')
querystring = require('querystring')

module.exports = (robot) ->
  robot.router.get '/hubot/httpd-echo', (req, res) ->
    query = querystring.parse(url.parse(req.url).query)
    user =
      room:
        id: '530210355e986b0712ef78cf'

    robot.send user, query.message
    res.end "message sent: #{query.message}"
