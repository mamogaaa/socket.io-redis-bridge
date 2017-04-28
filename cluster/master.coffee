cluster = require 'cluster'

for i in [1..CONFIG.threadsCount/1]
  cluster.fork()