require('dotenv').config()

global.CONFIG = require './config.coffee'

redis = require 'redis'
io = require('socket.io').listen CONFIG.port

client = redis.createClient CONFIG.redis

client.subscribe CONFIG.channel

client.on 'message', (channel, message) ->
  try
    message = JSON.parse message
    io.emit 'alal', 23123
    if message[CONFIG.channelNameField]
      io.emit message[CONFIG.channelNameField], message[CONFIG.dataField]
  catch e
    console.warn e