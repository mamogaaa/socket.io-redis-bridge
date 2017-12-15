express = require('express')
app = express()
io = require('socket.io')(CONFIG.port)
redis = require('socket.io-redis')
cluster = require('cluster')
io.adapter redis(
  host: 'localhost'
  port: 6379)
io.on 'connection', (socket) ->
  socket.emit 'data', 'connected to worker: ' + cluster.worker.id
  return
