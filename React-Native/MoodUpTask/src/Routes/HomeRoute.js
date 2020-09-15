import {createStackNavigator} from 'react-navigation-stack';
import {createAppContainer} from 'react-navigation';
import Home from '../Views/Home';
import Recipe from '../Views/Recipe';
import Header from '../Components/Header';
import React from 'react';

const views = {
  Home: {
    screen: Home,
    navigationOptions: {
      header: () => <Header title="RecipeMaster" />,
    },
  },
  Recipe: {
    screen: Recipe,
    navigationOptions: ({navigation}) => {
      return {
        header: () => <Header title="Pizza Recipe!" navigation={navigation} />,
      };
    },
  },
};

const HomeRoute = createStackNavigator(views, {
  headerTintColor: '#f44',
});

export default createAppContainer(HomeRoute);
