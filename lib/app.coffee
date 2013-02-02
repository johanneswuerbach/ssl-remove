express = require 'express'
util = require 'util'

module.exports = class App
  constructor : (port, callback) ->
    app = express()
    server = (require 'http').createServer app
    server.listen port, callback

    # Express
    app.get '/', (req, res) ->
      res.send ""

    app.all /\/([a-zA-Z\.]+)\/(\d+)\/(.*)/, (req, res) ->
      url = "http://#{req.params[0]}:#{req.params[1]}/"
      url += req.params[2] if req.params[2]?
      url += req._parsedUrl.search if req._parsedUrl.search
      res.redirect 307, url

    app.all '*', (req, res) ->
      res.send 400, "Invalid request."