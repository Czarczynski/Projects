import axios from 'axios';
import {createMessage, returnErrors} from './messages';
import {tokenConfig} from './auth';
import {API_PREFIX} from '../common/config';

import {
  GET_RESERVATIONS,
  DELETE_RESERVATIONS,
  ADD_RESERVATIONS,
  ADD_RENTAL,
  GET_ERRORS,
} from './types';

// GET RESERVATIONS
export const getReservations = () => (dispatch, getState) => {
  axios
    .get(API_PREFIX + '/api/car_reservation/', tokenConfig(getState))
    .then((res) => {
      dispatch({
        type: GET_RESERVATIONS,
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

// DELETE RESERVATIONS
export const deleteReservations = (id) => (dispatch, getState) => {
  axios
    .delete(API_PREFIX + `/api/car_reservation/${id}/`, tokenConfig(getState))
    .then((res) => {
      dispatch({
        type: DELETE_RESERVATIONS,
        payload: id,
      });
      dispatch(createMessage({reservationDeleted: 'Reservation deleted'}));
    })
    .catch((err) => {
      if (err.response == undefined)
        dispatch(returnErrors({no_internet: err.message}, 500));
      else dispatch(returnErrors(err.response.data, err.response.status));
    });
};

// ADD RESERVATIONS
export const addReservations = (reservation) => (dispatch, getState) => {
  axios
    .post(
      API_PREFIX + `/api/car_reservation/`,
      reservation,
      tokenConfig(getState),
    )
    .then((res) => {
      dispatch(createMessage({reservationAdded: 'Reservation added'}));
      dispatch({
        type: ADD_RESERVATIONS,
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

// RENT CARS
export const addRental = (id) => (dispatch, getState) => {
  axios
    .patch(
      API_PREFIX + `/api/car_reservation/${id}/`,
      {
        active: true,
        start_date: new Date().toISOString().substring(0, 16),
      },
      tokenConfig(getState),
    )
    .then((res) => {
      dispatch({
        type: ADD_RENTAL,
        payload: res.data,
      });
      dispatch(createMessage({carRented: 'Car rented'}));
    })
    .catch((err) => {
      if (err.response == undefined)
        dispatch(returnErrors({no_internet: err.message}, 500));
      else dispatch(returnErrors(err.response.data, err.response.status));
    });
};
