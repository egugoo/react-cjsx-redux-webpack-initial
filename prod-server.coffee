webpack = require 'webpack'
webpackDevMiddleware = require 'webpack-dev-middleware'
webpackHotMiddleware = require 'webpack-hot-middleware'
config = require './webpack.config'
express = require 'express'

app = express()
port = process.env.PORT ? 3000

app.use express.static 'dst'

app.use (req, res) ->
  res.sendFile __dirname + '/dst/index.html'

app.listen port, (error) ->
  if error
    console.error error
  else
    console.info "==> 🌎  Listening on port %s. \
      Open up http://localhost:%s/ in your browser.", port, port
