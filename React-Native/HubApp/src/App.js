import React from 'react';

import {Provider} from 'react-redux';
import store from './store';
import Alerts from './alerts/Alerts';
import CheckRoute from './routes/CheckRoute';

export default function App() {
  return (
    <Provider store={store}>
      <Alerts />
      <CheckRoute />
    </Provider>
  );
}
