express = require 'express'
routes = require './routes'
http = require 'http'
path = require 'path'
fs = require 'fs'

browserify = require 'browserify'
assets = require 'connect-assets'
io = require 'socket.io'

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.logger('dev')
  
  bundle = browserify(require: [
    './lib/board_display'
  ])
  try
    fs.mkdirSync __dirname + '/assets/js/build'
  catch e
  fs.writeFileSync __dirname + '/assets/js/build/browserify.js', bundle.bundle()
  
  if app.settings.env is 'production'
    assetOptions =
      buildDir: 'public'
      build: true
      detectChanges: false
    assets.cssCompilers.styl.compress = true
    assets.cssCompilers.less.compress = true
  else
    assetOptions =
      buildDir: false
      build: false
      
  app.use assets assetOptions
  
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static path.join __dirname, 'public'

app.configure 'development', ->
  app.use express.errorHandler()
  app.locals.pretty = true
  
app.get '/', routes.index

server = http.createServer(app)
io = io.listen server

server.listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')

io.sockets.on 'connection', (socket) ->
  console.log 'connected'
  
  setInterval ->
    socket.emit 'ping'
  , 5000
  
  socket.on 'pong', ->
    console.log 'pong!'
