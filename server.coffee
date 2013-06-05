express = require('./app').init(3000)
app = express["app"]
server = express["server"]
io = require('socket.io').listen(server)
redis = require('redis')

redisClient = redis.createClient()


app.get '/', (req, res) ->
	res.render 'index', { title: 'Chatberry' }

clients = []

io.sockets.on 'connection', (socket) ->
	clients.push socket
		
	socket.on 'join', (data) ->
		socket.set('username', data.username)		
		socket.emit 'new_join', { username: "You" }
		socket.broadcast.emit 'new_join', { username: data.username }
		redisClient.lrange "messages", 0, -1, (err, messages) ->
			messages = messages.reverse()
			for message in messages
				message = JSON.parse message
				socket.emit 'old_message', { username: message.username, text: message.text } 
		
		
	socket.on 'message', (data) ->
		socket.get 'username', (error, username) ->
			message = JSON.stringify({ username: username, text: data.text })
			socket.emit 'new_message', { username: "You", text: data.text }
			socket.broadcast.emit 'new_message', { username: username, text: data.text }
			redisClient.lpush "messages", message, (err, response) ->
				redisClient.ltrim("messages", 0, 10)

