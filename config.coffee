module.exports =
  port: process.env.PORT || 5000
  threadsCount: process.env.THREADS_COUNT || require('os').cpus().length
  redis:
    host: process.env.REDIS_HOST || 'localhost'
    port: process.env.REDIS_PORT || 6379

  channel: process.env.CHANNEL || 'echo'