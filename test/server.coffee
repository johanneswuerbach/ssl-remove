require 'should'
rest = require 'restler'
util = require 'util'
App = require '../lib/app'

describe 'Server', ->
  before (done) ->
    # Load server
    new App 5000, done

  describe '#index', ->
    it 'should return 200 and renders the index page', (done) ->
      rest.get('http://localhost:5000').on 'complete', (data, res) ->
        res.statusCode.should.equal 200
        done()

  describe '#redirect', ->
    it 'should deny redirects without a port', (done) ->
      rest.get('http://localhost:5000/localhost').on 'complete', (data, res) ->
        res.statusCode.should.equal 400
        done()

    it 'should deny redirects with an invalid port', (done) ->
      rest.get('http://localhost:5000/localhost/ads').on 'complete', (data, res) ->
        res.statusCode.should.equal 400
        done()

    it 'should respond with 307', (done) ->
      rest.get('http://localhost:5000/localhost/3000/').on 'complete', (data, res) ->
        res.statusCode.should.equal 307
        done()

    it 'should redirect to the correct url', (done) ->
      rest.get('http://localhost:5000/localhost/3000/test/123?some=value').on 'complete', (data, res) ->
        res.headers.location.should.equal "http://localhost:3000/test/123?some=value"
        done()
