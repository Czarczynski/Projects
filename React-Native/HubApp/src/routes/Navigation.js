import React from 'react';

import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator, TransitionPresets} from '@react-navigation/stack';
import {AppearanceProvider} from 'react-native-appearance';
import {connect} from 'react-redux';
import FormModal from '../views/FormModal';
import Header from '../components/Header';
import LoginPage from '../views/LoginPage';
import Dashboard from '../views/Dashboard';
import RegisterPage from '../views/RegisterPage';

const {Navigator, Screen} = createStackNavigator();

const HomeNavigator = () => (
  <Navigator initialRouteName="Dashboard">
    <Screen
      name="Dashboard"
      component={Dashboard}
      options={({navigation}) => {
        return {
          header: () => (
            <Header title="Dashboard" navigation={navigation} exit />
          ),
        };
      }}
    />
  </Navigator>
);

const navigation = ({auth}) => {
  return (
    <AppearanceProvider>
      <NavigationContainer>
        <Navigator
          headerMode="none"
          screenOptions={{
            gestureEnabled: true,
            ...TransitionPresets.ModalPresentationIOS,
          }}
          initialRouteName={auth.isAuthenticated ? 'Dashboard' : 'Login'}>
          <Screen
            name="Login"
            component={LoginPage}
            options={{
              ...TransitionPresets.FadeFromBottomAndroid,
              header: () => null,
            }}
          />
          <Screen
            name="Register"
            component={RegisterPage}
            options={{
              ...TransitionPresets.FadeFromBottomAndroid,
              header: () => null,
            }}
          />
          <Screen
            name="FormModal"
            component={FormModal}
            options={{
              ...TransitionPresets.ModalPresentationIOS,
              stackPresentation: 'modal',
            }}
          />
          <Screen
            name="Dashboard"
            component={HomeNavigator}
            options={{...TransitionPresets.FadeFromBottomAndroid}}
          />
        </Navigator>
      </NavigationContainer>
    </AppearanceProvider>
  );
};

const mapStateToProps = (state) => ({auth: state.auth});
export default connect(mapStateToProps)(navigation);
