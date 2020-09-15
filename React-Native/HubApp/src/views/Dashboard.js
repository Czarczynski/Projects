import React, {Component} from 'react';
import {SafeAreaView, Text, StyleSheet, View, Button} from 'react-native';
import {BG_COLOR} from '../common/config';

class Dashboard extends Component {
  render() {
    return (
      <SafeAreaView style={styles.view}>
        <View>
          <Button
            title="Kliknij tutaj!"
            onPress={() => {
              this.props.navigation.navigate('Example');
            }}
          />
        </View>
        <Text>Hej Ola</Text>
      </SafeAreaView>
    );
  }
}

const styles = StyleSheet.create({
  view: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: BG_COLOR,
  },
});

export default Dashboard;
