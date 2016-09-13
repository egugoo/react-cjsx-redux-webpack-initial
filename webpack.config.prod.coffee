'use strict'

path = require 'path'
webpack = require 'webpack'
autoprefixer = require 'autoprefixer'
ExtractTextPlugin = require 'extract-text-webpack-plugin'

module.exports =
  entry:
    app: [
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

  plugins: [
    new webpack.optimize.CommonsChunkPlugin \
      name: 'vendor', filename: 'vendor.bundle.js'
    new ExtractTextPlugin filename: 'app.css', allChunks: true
    new webpack.DefinePlugin \
    (
      'process.env.NODE_ENV': JSON.stringify('production')
    )
  ]

  resolve:
    extensions: [ '', '.js', '.cjsx', '.coffee' ]

  module:
    loaders: [
      test: /\.cjsx$/
      loader: 'coffee!cjsx'
    ,
      test: /\.coffee$/
      loader: 'coffee'
    ,
      test: /\.css$/
      loader: ExtractTextPlugin.extract \
        fallbackLoader: 'style',
        loader: 'css!postcss'
    ]

  postcss: [autoprefixer]
