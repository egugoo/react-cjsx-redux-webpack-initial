{ combineReducers } = require 'redux'
{ routerReducer } = require 'react-router-redux'

# types = require '../constants/ActionTypes'

initialState = {}

test = (state = initialState, { type, payload }) ->
  switch type
    when 'ASDF' #types.RECEIVE_VERSIONS
      Object.assign {}, state,
        'versions': 'asdf'

    else
      state

module.exports = combineReducers
  routing: routerReducer
  test: test
