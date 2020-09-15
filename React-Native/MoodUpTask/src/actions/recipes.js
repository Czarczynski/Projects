import axios from 'axios';
import {GET_RECIPES, LOADING_RECIPES} from './types';

export const getRecipes = () => (dispatch) => {
  dispatch({
    type: LOADING_RECIPES,
    loading: true,
  });
  axios
    .get('https://moodup.team/test/info.php')
    .then((res) => {
      dispatch({
        type: GET_RECIPES,
        payload: res.data,
        loading: false,
      });
    })
    .catch((error) => console.log(error));
};
