$ ->
	$('#chat-bar').hide()
	window.username = "The Nameless One"
	socket = io.connect 'http://localhost:3000'
	socket.on 'connect', () ->
		logger "Connected"
		user = socket.socket.sessionid

	socket.on 'new_join', (data) ->
		logger "<b>#{data.username}</b> joined"
		
	socket.on 'new_message', (data) ->
		logger "<b>#{data.username}:</b> #{data.text}"
			
	$('#join').click () ->
		$('#chat-bar').show()
		window.username = $('#username').val() if $('#username').val() != ""
		socket.emit 'join', { username: window.username }
				
	$('#chat-form').submit (event) ->
		event.preventDefault()
		socket.emit 'message', { text: $('#text').val() }
		$('#text').val("")
		  
	socket.on 'error', () ->
		console.log "Error Occured"
		
	
logger = (data) ->
	br = if ($("#chat").text() == "") then "" else "<br />"
	$("#chat").append br + data
	$("#chat").scrollTop $("#chat")[0].scrollHeight