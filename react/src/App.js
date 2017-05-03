import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import SearchBarContainer from './containers/SearchBarContainer';
import MovieShowContainer from './containers/MovieShowContainer'

const App = () => {
  return(
      <Router history={browserHistory}>
      </Router>
    )
  }

export default App;
