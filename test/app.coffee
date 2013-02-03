require 'should'
rest = require 'restler'
util = require 'util'
App = require '../lib/app'

get = (url, cb) ->
  rest.get(url, {followRedirects: false}).on 'complete', (data, res) ->
    cb? data, res

describe 'Server', ->
  before (done) ->
    # Load server
    new App 5000, done

  describe '#index', ->
    it 'should return 302', (done) ->
      get 'http://localhost:5000', (data, res) ->
        res.statusCode.should.equal 302
        done()
    it 'should redirect to github', (done) ->
      get 'http://localhost:5000', (data, res) ->
        res.headers.location.should.equal "https://github.com/johanneswuerbach/ssl-remove#readme"
        done()

  describe '#redirect', ->
    it 'should deny redirects without a port', (done) ->
      get 'http://localhost:5000/localhost', (data, res) ->
        res.statusCode.should.equal 400
        done()

    it 'should deny redirects with an invalid port', (done) ->
      get 'http://localhost:5000/localhost/ads', (data, res) ->
        res.statusCode.should.equal 400
        done()

    it 'should respond with 307', (done) ->
      get 'http://localhost:5000/localhost/3000/', (data, res) ->
        res.statusCode.should.equal 307
        done()

    it 'should redirect to the correct url', (done) ->
      get 'http://localhost:5000/localhost/3000/test/123?some=value', (data, res) ->
        res.headers.location.should.equal "http://localhost:3000/test/123?some=value"
        done()
