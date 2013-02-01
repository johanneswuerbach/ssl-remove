
express = require 'express'
util = require 'util'
app = express()
server = (require 'http').createServer app

server.listen (process.env.PORT || 3000)

# Express
app.all '*', (req, res) ->
  res.redirect "http://localhost:3000" + req.url

