import axios from 'axios';
import {createMessage, returnErrors} from './messages';
import {tokenConfig} from './auth';

import {ADD_ARCHIVE, GET_ARCHIVE} from './types';
import {API_PREFIX} from '../common/config';

// GET ARCHIVE
export const getArchive = () => (dispatch, getState) => {
  axios
    .get(API_PREFIX + '/api/archive/', tokenConfig(getState))
    .then((res) => {
      dispatch({
        type: GET_ARCHIVE,
        payload: res.data,
      });
    })
    .catch((err) => {
      console.log({err: err.response.data});
      if (err.response == undefined)
        dispatch(returnErrors({no_internet: err.message}, 500));
      else dispatch(returnErrors(err.response.data, err.response.status));
    });
};
// ADD ARCHIVE
export const addArchive = (archive) => (dispatch, getState) => {
  axios
    .post(API_PREFIX + `/api/archive/`, archive, tokenConfig(getState))
    .then((res) => {
      dispatch(createMessage({archiveAdded: 'Car returned'}));
      dispatch({
        type: ADD_ARCHIVE,
        payload: res.data,
      });
      return true;
    })
    .catch((err) => {
      if (err.response == undefined || err.response.status === 500)
        dispatch(returnErrors({no_internet: err.message}, 500));
      else dispatch(returnErrors(err.response.data, err.response.status));
      return false;
    });
};
