console.log "Worker #{process.pid} started"

redis = require 'redis'
io = require('socket.io').listen CONFIG.port

client = redis.createClient CONFIG.redis

client.subscribe CONFIG.channel

client.on 'message', (channel, message) ->
  try
    message = JSON.parse message
    if message.channel
      io.emit message.channel, message.data
  catch e
    console.warn e


