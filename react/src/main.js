import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import SearchBar from './components/searchBar'


$(function() {
  ReactDOM.render(
    <SearchBar />,
    document.getElementById('app')
  );
});
