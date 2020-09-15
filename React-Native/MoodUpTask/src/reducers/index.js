import {combineReducers} from 'redux';
import recipes from './recipes';
import facebook from './facebook';
export default combineReducers({
  recipes,
  facebook,
});
