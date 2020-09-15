import { combineReducers } from "redux";
import reservations from "./reservations";
import errors from "./errors";
import messages from "./messages";
import auth from "./auth";
import archive from "./archive";

export default combineReducers({
  reservations,
  errors,
  messages,
  auth,
  archive
});
