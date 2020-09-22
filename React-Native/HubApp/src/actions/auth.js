import axios from 'axios';
import {API_PREFIX} from '../common/config';
import {createMessage, returnErrors} from './messages';

import {
  USER_LOADED,
  USER_LOADING,
  AUTH_ERROR,
  LOGIN_SUCCESS,
  LOGIN_FAIL,
  LOGOUT_SUCCESS,
  REGISTER_SUCCESS,
  REGISTER_FAIL,
} from './types';

// CHECK TOKEN & LOAD USER
export const loadUser = () => (dispatch, getState) => {
  // User Loading
  dispatch({type: USER_LOADING});

  axios
    .get(API_PREFIX + '/api/auth/user', tokenConfig(getState))
    .then((res) => {
      dispatch({
        type: USER_LOADED,
        payload: res.data,
      });
    })
    .catch((err) => {
      if (err.response.data == undefined || err.response.status === 404)
        dispatch(returnErrors({no_internet: err.message}, 500));
      dispatch(returnErrors(err.response.data, err.response.status));
      dispatch({
        type: AUTH_ERROR,
      });
    });
};

// LOGIN USER
export const login = (username, password) => (dispatch) => {
  // Headers
  const config = {
    headers: {
      'Content-Type': 'application/json',
    },
  };

  // Request Body
  const body = JSON.stringify({username, password});
  axios
    .post(API_PREFIX + '/api/auth/login', body, config)
    .then((res) => {
      dispatch({
        type: LOGIN_SUCCESS,
        payload: res.data,
      });
    })
    .catch((err) => {
      if (err.response == undefined || err.response.status === 404)
        dispatch(returnErrors({no_internet: err.message}, 500));
      else dispatch(returnErrors(err.response.data, err.response.status));
      dispatch({
        type: LOGIN_FAIL,
      });
    });
};

// REGISTER USER
export const register = ({username, password, email}) => (dispatch) => {
  // Headers
  const config = {
    headers: {
      'Content-Type': 'application/json',
    },
  };

  // Request Body
  const body = JSON.stringify({username, email, password});

  axios
    .post(API_PREFIX + '/api/auth/register', body, config)
    .then((res) => {
      dispatch({
        type: REGISTER_SUCCESS,
        payload: res.data,
      });
    })
    .catch((err) => {
      if (err.response == undefined || err.response.status === 404)
        dispatch(returnErrors({no_internet: err.message}, 500));
      dispatch(returnErrors(err.response.data, err.response.status));
      dispatch({
        type: REGISTER_FAIL,
      });
    });
};

// LOGOUT USER
export const logout = () => (dispatch, getState) => {
  axios
    .post(API_PREFIX + '/api/auth/logout/', null, tokenConfig(getState))
    .then((res) => {
      dispatch({type: 'CLEAR_RESERVATIONS'});
      dispatch({
        type: LOGOUT_SUCCESS,
      });
    })
    .catch((err) => {
      if (err.response == undefined || err.response.status === 404)
        dispatch(returnErrors({no_internet: err.message}, 500));
      dispatch(returnErrors(err.response.data, err.response.status));
    });
};

// Setup config with token - helper function
export const tokenConfig = (getState) => {
  // Get token from state
  const token = getState().auth.token;

  // Headers
  const config = {
    headers: {
      'Content-Type': 'application/json',
    },
  };

  // If token, add to headers config
  if (token) {
    config.headers['Authorization'] = `Token ${token}`;
  }

  return config;
};
