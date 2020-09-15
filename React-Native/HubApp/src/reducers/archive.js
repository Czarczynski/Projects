import { ADD_ARCHIVE, GET_ARCHIVE } from "../actions/types";

const initialState = {
  archive: []
};

export default function(state = initialState, action) {
  switch (action.type) {
    case GET_ARCHIVE:
      return {
        ...state,
        archive: action.payload
      };
    case ADD_ARCHIVE:
      return {
        ...state,
        archive: [...state.archive, action.payload]
      };
    default:
      return state;
  }
}
