$ ->
	window.newMessages = 0
	flashTitle()
	$('#chat-bar').hide()
	window.username = "The Nameless One"
	socket = io.connect 'http://localhost:3000'
	socket.on 'connect', () ->
		logger "Connected"
		user = socket.socket.sessionid

	socket.on 'new_join', (data) ->
		logger "<b>#{data.username}</b> joined"
		
	socket.on 'new_message', (data) ->
		if data.username == 'You' 
			klass = 'your-message'
		else
			window.newMessages = window.newMessages + 1
			klass = ''
		logger "<span class='#{klass}'><b>#{data.username}:</b> #{data.text}</span>"
	
	socket.on 'old_message', (data) ->
		logger "<span class='old-message'><b>#{data.username}:</b> #{data.text}</span>"
			
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
	
	
flashTitle = () ->
	timer = ""
	isBlurred = false
	$(window).on "blur", () ->
		isBlurred = true;
		timer = window.setInterval( () ->
			document.title = if document.title == "Chatberry" && window.newMessages > 0 then "Chatberry (#{window.newMessages})" else "Chatberry"
		, 1000)
	$(window).on "focus", () ->
		isBlurred = false
		window.newMessages = 0
		document.title = "Chatberry"
		clearInterval timer