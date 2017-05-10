module.exports =
  port: process.env.PORT || 5000
  threadsCount: process.env.THREADS_COUNT || require('os').cpus().length
  redis:
    host: process.env.REDIS_HOST || 'localhost'
    port: process.env.REDIS_PORT || 6379
    password: process.env.REDIS_PASSWORD || undefined

  channel: process.env.CHANNEL || 'echo'

  dataField: process.env.DATA_FIELD || 'data'
  channelNameField: proccess.env.CHANNEL_NAME_FIELD || 'event'