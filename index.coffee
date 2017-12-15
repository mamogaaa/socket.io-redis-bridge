require('dotenv').config()

global.CONFIG = require './config.coffee'

redis = require 'redis'
io = require('socket.io').listen CONFIG.port

pubClient = redis.createClient CONFIG.redis

client = redis.createClient CONFIG.redis

client.subscribe CONFIG.channel

client.on 'message', (channel, message) ->
  try
    message = JSON.parse message
    if message[CONFIG.channelNameField]
      io.emit message[CONFIG.channelNameField], message[CONFIG.dataField]
      pubClient.rpush 'centrifugo.api', JSON.stringify
        method: 'publish',
        params:
          channel: message[CONFIG.channelNameField]
          data: message[CONFIG.dataField]
  catch e
    console.warn e