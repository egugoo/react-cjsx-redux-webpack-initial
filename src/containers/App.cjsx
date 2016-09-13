debug = ntuiDebug?('neptune:containers:App') ? -> null

React = require 'react'
{ Link } = require 'react-router'
{ connect } = require 'react-redux'

App = React.createClass
  displayName: 'App'

  render: ->
    <h1>APP</h1>

mapStateToProps = (state) ->
  {}

module.exports = connect(mapStateToProps) App
