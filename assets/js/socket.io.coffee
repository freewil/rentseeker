socket = io.connect 'http://localhost:3000'

socket.on 'connect', ->
  console.log 'connected!'
  
  socket.on 'ready', ->
    console.log 'connected!'
    
  socket.on 'ping', ->
    console.log 'ping?'
    socket.emit 'pong'
