import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer, 
    preloadedState, 
    applyMiddleware(addLoggingToDispatch, sillyMiddleware)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

const addLoggingToDispatch = store => next => action => {
  console.log('State pre-dispatch:', store.getState());
  console.log('Action received:', action);
  next(action);
  console.log('State post-dispatch:', store.getState());
};

const sillyMiddleware = store => next => action => {
  console.log('silly');
  next(action);
};

export default configureStore;
