import React from 'react';

import Dashboard from '../views/Dashboard';
import Example from '../views/Example';
import Header from '../components/Header';
import {createAppContainer} from 'react-navigation';
import {createStackNavigator} from 'react-navigation-stack';

const views = {
  Dashboard: {
    screen: Dashboard,
    navigationOptions: {
      header: () => <Header title="Dashboard" />,
    },
  },
  Example: {
    screen: Example,
    navigationOptions: ({navigation}) => {
      return {
        header: () => <Header title="Example" navigation={navigation} />,
      };
    },
  },
};

const Navigation = createStackNavigator(views);

export default createAppContainer(Navigation);
