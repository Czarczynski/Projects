import {
  GET_RESERVATIONS,
  DELETE_RESERVATIONS,
  ADD_RESERVATIONS,
  ADD_RENTAL,
} from '../actions/types.js';

const initialState = {
  reservations: [],
};

export default function (state = initialState, action) {
  switch (action.type) {
    case GET_RESERVATIONS:
      return {
        ...state,
        reservations: action.payload,
      };
    case DELETE_RESERVATIONS:
      return {
        ...state,
        reservations: [
          ...state.reservations.filter(
            (reservation) => reservation.id !== action.payload,
          ),
        ],
      };
    case ADD_RESERVATIONS:
      return {
        ...state,
        reservations: [...state.reservations, action.payload],
      };
    case ADD_RENTAL:
      return {
        ...state,
        reservations: [
          action.payload,
          ...state.reservations.filter((item) => item.id !== action.payload.id),
        ],
      };
    default:
      return state;
  }
}
