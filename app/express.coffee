config = require('../config')()
express = require 'express'
http = require 'http'
path = require 'path'
routes = require path.join(__dirname, '../', 'config', 'routes')
user = require path.join(__dirname, '../', 'config', 'user')

app = express()

# all environments
app.configure ->
	app.set 'port', process.env.PORT or 3000
	app.set 'views', path.join(__dirname, '../', '/views')
	app.set 'view engine', 'jade'
	app.use express.favicon()
	app.use express.logger('dev')
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.cookieParser('your secret here')
	app.use express.session()
	app.use app.router
	app.use express.static(path.join(__dirname, '../', 'public'))
	app.use require('connect-assets')(
		src: path.join(__dirname, 'assets')
		)

# development only
app.configure 'development', ->
	app.use express.errorHandler() 

app.get '/', routes.index
app.get '/users', user.list

http.createServer(app).listen config.port, ->
  console.log "Express server listening on port #{config.port}"