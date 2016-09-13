debug = myDebug?('opic:index') ? -> null
myDebug?.enable '*'

React = require 'react'
{ render } = require 'react-dom'
{ Provider } = require 'react-redux'
{ Router, Route, IndexRoute, IndexRedirect, browserHistory } = require 'react-router'
{ syncHistoryWithStore, push } = require 'react-router-redux'
configureStore = require './store/configureStore'

require './styles/app.css'
App = require './containers/App'
Home = require './containers/Home'

store = configureStore()
history = syncHistoryWithStore browserHistory, store

target = document.getElementById 'root'
node =
  <Provider store={store}>
    <Router history={history}>
      <Route path='/' component={App}>
      </Route>
    </Router>
  </Provider>

render node, target
