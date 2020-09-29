import React from 'react';

import {Provider} from 'react-redux';
import store from './store';
import Alerts from './alerts/Alerts';
import Navigation from './routes/Navigation';
import {StatusBar} from 'react-native';

export default function App() {
  return (
    <Provider store={store}>
      <Alerts />
      <StatusBar barStyle="dark-content" backgroundColor="red" />
      <Navigation />
    </Provider>
  );
}
