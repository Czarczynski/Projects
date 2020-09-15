import axios from "axios";
import { createMessage, returnErrors } from "./messages";
import { tokenConfig } from "./auth";

import {
  GET_RESERVATIONS,
  DELETE_RESERVATIONS,
  ADD_RESERVATIONS,
  ADD_RENTAL,
  GET_ERRORS
} from "./types";

// GET RESERVATIONS
export const getReservations = () => (dispatch, getState) => {
  axios
    .get("/api/car_reservation/", tokenConfig(getState))
    .then(res => {
      dispatch({
        type: GET_RESERVATIONS,
        payload: res.data
      });
    })
    .catch(err =>
      dispatch(returnErrors(err.response.data, err.response.status))
    );
};

// DELETE RESERVATIONS
export const deleteReservations = id => (dispatch, getState) => {
  axios
    .delete(`/api/car_reservation/${id}/`, tokenConfig(getState))
    .then(res => {
      dispatch({
        type: DELETE_RESERVATIONS,
        payload: id
      });
      dispatch(createMessage({ reservationDeleted: "Reservation deleted" }));
    })
    .catch(err =>
      dispatch(returnErrors(err.response.data, err.response.status))
    );
};

// ADD RESERVATIONS
export const addReservations = reservation => (dispatch, getState) => {
  axios
    .post(`/api/car_reservation/`, reservation, tokenConfig(getState))
    .then(res => {
      dispatch(createMessage({ reservationAdded: "Reservation added" }));
      dispatch({
        type: ADD_RESERVATIONS,
        payload: res.data
      });
    })
    .catch(err =>
      dispatch(returnErrors(err.response.data, err.response.status))
    );
};

// RENT CARS
export const addRental = id => (dispatch, getState) => {
  axios
    .patch(
      `/api/car_reservation/${id}/`,
      {
        active: true
      },
      tokenConfig(getState)
    )
    .then(res => {
      dispatch(createMessage({ carRented: "Car rented" }));
      dispatch({
        type: ADD_RENTAL,
        payload: res.data
      });
    })
    .catch(err =>
      dispatch(returnErrors(err.response.data, err.response.status))
    );
};
