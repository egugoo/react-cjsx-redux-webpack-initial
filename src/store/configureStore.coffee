{ createStore, applyMiddleware, compose } = require 'redux'
{ browserHistory } = require 'react-router'
{ routerMiddleware } = require 'react-router-redux'
thunk = require('redux-thunk').default
# api = require '../middleware/api'
reducers = require '../reducers'

routermw = routerMiddleware browserHistory

module.exports = (initialState) ->
  createStore \
    reducers,
    initialState,
    compose \
      applyMiddleware(thunk, routermw), #, api),
      if window.devToolsExtension
        window.devToolsExtension()
      else
        (x) -> x
