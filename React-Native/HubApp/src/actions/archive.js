import axios from "axios";
import { createMessage, returnErrors } from "./messages";
import { tokenConfig } from "./auth";

import { ADD_ARCHIVE, GET_ARCHIVE } from "./types";

// GET ARCHIVE
export const getArchive = () => (dispatch, getState) => {
  axios
    .get("/api/archive/", tokenConfig(getState))
    .then(res => {
      dispatch({
        type: GET_ARCHIVE,
        payload: res.data
      });
    })
    .catch(err =>
      dispatch(returnErrors(err.response.data, err.response.status))
    );
};
// ADD ARCHIVE
export const addArchive = archive => (dispatch, getState) => {
  axios
    .post(`/api/archive/`, archive, tokenConfig(getState))
    .then(res => {
      dispatch(createMessage({ archiveAdded: "Car returned" }));
      dispatch({
        type: ADD_ARCHIVE,
        payload: res.data
      });
    })
    .catch(err =>
      dispatch(returnErrors(err.response.data, err.response.status))
    );
};
