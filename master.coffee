cluster = require('cluster')
os = require('os')
redis = require('socket.io-redis')

server = require('http').createServer()
io = require('socket.io').listen(server, CONFIG.port)
redis = require('socket.io-redis')

io.adapter(redis({ host: 'localhost', port: 6379 }))

# setInterval (->
#   # all workers will receive this in Redis, and emit
#   io.emit 'data', 'payload'
#   return
# ), 1000

i = 0
while i < os.cpus().length
  cluster.fork()
  i++