'use strict'

path = require 'path'
webpack = require 'webpack'
autoprefixer = require 'autoprefixer'

module.exports =
  devtool: '#cheap-module-eval-source-map'

  entry:
    app: [
      'webpack-hot-middleware/client'
      (path.join __dirname, 'src/index.cjsx')
    ]
    vendor: [
      'react'
      'redux'
      'lodash'
    ]

  output:
    path: path.join __dirname, 'dst'
    filename: 'bundle.js'
    publicPath: '/'

  plugins: [
    new webpack.optimize.CommonsChunkPlugin \
      name: 'vendor', filename: 'vendor.bundle.js'
    new webpack.HotModuleReplacementPlugin()
    new webpack.NoErrorsPlugin()
    new webpack.ProvidePlugin(
      'myDebug': 'debug'
    )
  ]

  resolve:
    extensions: [ '', '.js', '.cjsx', '.coffee' ]

  module:
    loaders: [
      test: /\.cjsx$/
      loader: 'react-hot/webpack!coffee!cjsx'
    ,
      test: /\.coffee$/
      loader: 'coffee'
    ,
      test: /\.css$/
      loader: 'style!css!postcss'
    ]

  sassLoader:
    indentedSyntax: true

  postcss: [autoprefixer]
