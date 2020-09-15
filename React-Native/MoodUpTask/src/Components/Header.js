import React from 'react';
import {View, Text, StyleSheet} from 'react-native';
import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';
import {faArrowLeft} from '@fortawesome/free-solid-svg-icons';
export default function Header({title, navigation}) {
  return (
    <View style={styles.appBar}>
      {navigation ? (
        <FontAwesomeIcon
          style={styles.arrow}
          icon={faArrowLeft}
          size={28}
          onPress={() => navigation.goBack()}
        />
      ) : null}
      <View>
        <Text style={styles.title}>{title}</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  appBar: {
    width: '100%',
    height: 100,
    flexDirection: 'row',
    backgroundColor: '#f44',
    alignItems: 'center',
    justifyContent: 'flex-start',
    padding: 20,
  },
  title: {
    color: 'white',
    fontWeight: '700',
    fontSize: 30,
    paddingTop: 30,
    paddingRight: 20,
  },
  arrow: {
    color: 'white',
    marginTop: 40,
    marginRight: 20,
  },
});
