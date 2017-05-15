import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import DiscussionShowContainer from './containers/DiscussionShowContainer';


const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path='/' >
        <Route path="groups/:id" component={DiscussionShowContainer} />
      </Route>
    </Router>
  );
}

export default App;
