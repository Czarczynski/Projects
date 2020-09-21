import React from 'react';

import {Provider} from 'react-redux';
import store from './store';
import Alerts from './alerts/Alerts';
import Navigation from './routes/Navigation';
import {BG_COLOR} from './common/config';

export default function App() {
  return (
    <Provider store={store}>
      <Alerts />
      <Navigation />
    </Provider>
  );
}
