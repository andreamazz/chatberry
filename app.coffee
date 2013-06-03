express = require('express')
engine = require('express-hbs')
app = express()

handlebar_helpers = require('./lib/handlebar_helpers')(engine)

exports.init = (port) ->
	
	app.configure () ->
		app.use(express.bodyParser())
		app.use(express.methodOverride())
		app.use(express.static(__dirname + '/static'))
		app.use(app.router)
		app.enable("jsonp callback")
		app.engine('hbs', engine.express3({
			defaultLayout: __dirname + '/views/layout.hbs',
			contentHelperName: 'content',
		}))
		app.set('view engine', 'hbs')
		app.set('views', __dirname + '/views')
		# enables coffeescript compilation
		app.use require('connect-assets') dst: "#{__dirname}/public/js"

	app.configure 'development', () ->
		app.use(express.errorHandler({ dumpExceptions: true, showStack: true }))

	app.configure 'production', () ->
		app.use(express.errorHandler())

	app.use (err, req, res, next) ->
		res.render '500.ejs', { locals: { error: err }, status: 500 }
    
	server = app.listen port
	
	console.log "Listening on port #{server.address().port} in #{app.settings.env} mode"
	
	return { "app": app, "server": server }