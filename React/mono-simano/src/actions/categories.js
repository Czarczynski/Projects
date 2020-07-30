import axios from "axios";
import { GET_CATEGORIES } from "./types";

export const getCategories = () => (dispatch) => {
  axios
    .get("https://localhost:5001/api/categories")
    .then((res) => {
      dispatch({
        type: GET_CATEGORIES,
        payload: res.data,
      });
    })
    .catch((error) => {
      console.log(error.message);
    });
};
