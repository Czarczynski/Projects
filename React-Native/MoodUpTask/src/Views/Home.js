import React, {Fragment, Component} from 'react';

import {StyleSheet, Text, SafeAreaView, Image, Dimensions} from 'react-native';
import {FloatingAction} from 'react-native-floating-action';
import bg from '../../assets/bg-pizza.jpg';
import PropTypes from 'prop-types';

import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';
import {faFacebookF} from '@fortawesome/free-brands-svg-icons';
import {faAtom} from '@fortawesome/free-solid-svg-icons';
import {connect} from 'react-redux';
import {getFacebookLogin, logoutFacebook} from '../actions/facebook';
import GLOBAL from '../actions/global';

export class Home extends Component {
  static propTypes = {
    facebook: PropTypes.object,
  };

  render() {
    return (
      <Fragment>
        <SafeAreaView style={styles.container}>
          <Image style={styles.image} source={bg} />
          <Text style={styles.textInCircle}>RecipeMaster</Text>
        </SafeAreaView>
        <FloatingAction
          color={'#ffab00'}
          actions={actions}
          onPressItem={(name) => {
            if (name === 'Recipe') this.props.navigation.navigate(name);
            else {
              if (GLOBAL.facebook.logout) this.props.logoutFacebook();
              else this.props.getFacebookLogin();
            }
          }}
        />
      </Fragment>
    );
  }
}

const actions = [
  {
    position: 2,
    color: '#01579b',
    name: 'bt_fb',
    text: 'Zaloguj się przez Facebooka',
    icon: <FontAwesomeIcon icon={faFacebookF} color="white" size={24} />,
  },
  {
    color: '#f44336',
    position: 1,
    name: 'Recipe',
    text: 'Get the recipe',
    icon: <FontAwesomeIcon icon={faAtom} color="white" size={24} />,
  },
];

const styles = StyleSheet.create({
  container: {
    fontFamily: 'Helvetica',
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  image: {
    position: 'absolute',
    opacity: 0.6,
    width: Dimensions.get('window').width * 0.7,
    height: Dimensions.get('window').width * 0.7,
    borderRadius: Dimensions.get('window').width * 0.35,
    backgroundColor: '#ccc',
  },
  textInCircle: {
    position: 'absolute',
    fontSize: 24,
    alignItems: 'center',
    justifyContent: 'center',
    fontWeight: '700',
  },
});

const mapStateToProps = (state) => ({
  facebook: state.facebook.facebook,
});

export default connect(mapStateToProps, {
  getFacebookLogin,
  logoutFacebook,
})(Home);
