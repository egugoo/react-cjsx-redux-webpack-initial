'use strict'

switch process.env.NODE_ENV
  when 'production'
    module.exports = require './webpack.config.prod'
  else
    module.exports = require './webpack.config.dev'
