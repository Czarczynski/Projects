import {GET_RECIPES, LOADING_RECIPES} from '../actions/types';
const initialState = {
  recipes: {},
};

export default function (state = initialState, action) {
  switch (action.type) {
    case GET_RECIPES:
      return {
        ...state,
        recipes: action.payload,
        loading: action.loading,
      };
    case LOADING_RECIPES:
      return {
        ...state,
        loading: action.loading,
      };
    default:
      return state;
  }
}
