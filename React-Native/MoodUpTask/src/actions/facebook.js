import {
  GraphRequest,
  GraphRequestManager,
  LoginManager,
} from 'react-native-fbsdk';
import {GET_FACEBOOK, LOGOUT_FACEBOOK} from './types';
import GLOBAL from '../actions/global';

export const getFacebookLogin = () => async (dispatch, accessToken) => {
  console.log({here: '1'});

  await LoginManager.logInWithPermissions().then(
    function (result) {
      if (result.isCancelled) {
      } else {
        new GraphRequestManager()
          .addRequest(
            new GraphRequest(
              '/me?fields=id,name',
              {},
              (error, myProfileInfoResult) => {
                console.log({here: '2'});
                if (error) {
                  console.log({loginInfoHasError: error});
                } else {
                  GLOBAL.facebook = {...myProfileInfoResult, logout: true};
                  dispatch({
                    type: GET_FACEBOOK,
                    payload: myProfileInfoResult,
                  });
                  console.log({result: myProfileInfoResult});
                }
              },
            ),
          )
          .start();
      }
    },
    function (error) {
      console.log('Login fail with error: ' + error);
    },
  );
};

export const logoutFacebook = () => (dispatch) => {
  GLOBAL.facebook = {logout: false};
  dispatch({
    type: LOGOUT_FACEBOOK,
    payload: {},
  });
};
