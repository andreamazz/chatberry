express = require('express')
engine = require('ejs-locals')
app = express()

exports.init = (port) ->
	
	app.configure () ->
		app.set('views', __dirname + '/views')
		app.set('view engine', 'ejs')
		app.use(express.bodyParser())
		app.use(express.methodOverride())
		app.use(express.static(__dirname + '/static'))
		app.use(app.router)
		app.enable("jsonp callback")
		app.engine('ejs', engine)
		# enables coffeescript compilation
		app.use require('connect-assets')()

	app.configure 'development', () ->
		app.use(express.errorHandler({ dumpExceptions: true, showStack: true }))

	app.configure 'production', () ->
       app.use(express.errorHandler())

	app.use (err, req, res, next) ->
		res.render '500.ejs', { locals: { error: err }, status: 500 }
    
	server = app.listen port

	console.log "Listening on port #{server.address().port} in #{app.settings.env} mode"
	
	return app