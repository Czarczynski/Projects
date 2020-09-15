import React from 'react';

import Header from '../components/Header';
import {createAppContainer} from 'react-navigation';
import {createStackNavigator} from 'react-navigation-stack';
import LoginPage from '../views/LoginPage';
import RegisterPage from '../views/RegisterPage';

const views = {
  Login: {
    screen: LoginPage,
    navigationOptions: {
      header: () => null,
    },
  },
  Register: {
    screen: RegisterPage,
    navigationOptions: {
      header: () => null,
    },
  },
};

const PrivateNavigation = createStackNavigator(views);

export default createAppContainer(PrivateNavigation);
