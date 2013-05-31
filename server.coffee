io = require('socket.io').listen(3000)
app = require('./app').init(8080);

locals = {
	title: 		 'Chatberry',
	_layoutFile: true
}

app.get '/', (req, res) ->
	res.render 'index', locals

clients = []

io.sockets.on 'connection', (socket) ->
	clients.push socket
		
	socket.on 'join', (data) ->
		client.emit 'new_join', { username: data.username } for client in clients
		
	socket.on 'message', (data) ->
		client.emit 'new_message', { username: data.username, text: data.text } for client in clients