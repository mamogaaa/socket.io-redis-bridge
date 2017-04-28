require('dotenv').config()
cluster = require 'cluster'

global.CONFIG = require './config.coffee'


if cluster.isMaster
  require './cluster/master.coffee'
else
  require './cluster/worker.coffee'

