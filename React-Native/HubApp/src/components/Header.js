import React from 'react';
import {SafeAreaView, StyleSheet, Text, Button, View} from 'react-native';

import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';
import {faArrowLeft, faSignOutAlt} from '@fortawesome/free-solid-svg-icons';
import {connect} from 'react-redux';
import {logout} from '../actions/auth';
import {MAIN_COLOR, SMOKE_WHITE} from '../common/config';

function Header({title, navigation, logout}) {
  return (
    <SafeAreaView style={styles.appBar}>
      {navigation ? (
        <FontAwesomeIcon
          style={styles.arrow}
          icon={faArrowLeft}
          size={25}
          onPress={() => navigation.goBack()}
        />
      ) : (
        <View style={styles.placeholder}></View>
      )}
      <View>
        <Text style={styles.title}>{title}</Text>
      </View>
      <FontAwesomeIcon
        style={styles.arrow}
        icon={faSignOutAlt}
        size={25}
        onPress={() => logout()}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  appBar: {
    height: 110,
    flexDirection: 'row',
    backgroundColor: MAIN_COLOR,
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  title: {
    color: SMOKE_WHITE,
    fontWeight: '500',
    fontSize: 30,
  },
  arrow: {
    color: SMOKE_WHITE,
    marginHorizontal: 20,
    paddingHorizontal: 20,
  },
  placeholder: {
    paddingVertical: 14,
    paddingHorizontal: 20,
    marginHorizontal: 20,
  },
});

const mapStateToProps = (state) => ({});

export default connect(mapStateToProps, {logout})(Header);
