import {GET_FACEBOOK, LOGOUT_FACEBOOK} from '../actions/types';
const initialState = {
  facebook: {},
};

export default function (state = initialState, action) {
  switch (action.type) {
    case GET_FACEBOOK:
      return {
        ...state,
        facebook: action.payload,
      };
    case LOGOUT_FACEBOOK:
      return {
        ...state,
        facebook: action.payload,
      };
    default:
      return state;
  }
}
