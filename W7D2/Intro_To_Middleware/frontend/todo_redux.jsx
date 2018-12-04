import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';
import { applyMiddleware } from 'redux';

// Phase 1 (Logging)
// const addLoggingToDispatch = store => {
//   const dispatching = store.dispatch; 
//   return (action) => {
//     console.log('State pre-dispatch:', store.getState());
//     console.log('Action received:', action);
//     dispatching(action);
//     console.log('State post-dispatch:', store.getState());
//   }
// };

// Phase 2 (Refactoring)
// const addLoggingToDispatch = store => next => action => {
//   const dispatching = store.dispatch; 
//   return (action) => {
//     console.log('State pre-dispatch:', store.getState());
//     console.log('Action received:', action);
//     dispatching(action);
//     console.log('State post-dispatch:', store.getState());
//   }
// };

// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach( middleware => {
//     dispatch = middleware(store)(dispatch)
//   })

//   Object.assign({}, store, { dispatch })
// }


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store); //Phase 1
  store = applyMiddlewares(store, addLoggingToDispatch) //Phase 2

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
