import React, {Component} from 'react';
import {login} from '../actions/auth';
import {
  SafeAreaView,
  Text,
  StyleSheet,
  View,
  Button,
  Dimensions,
  ScrollView,
  Image,
  TextInput,
} from 'react-native';
import {connect} from 'react-redux';
import {BG_COLOR, ERROR_RED, MAIN_COLOR} from '../common/config';

class LoginPage extends Component {
  state = {
    username: '',
    password: '',
    error: '',
  };
  handleSubmit = () => {
    if (this.state.username === '' || this.state.password === '')
      this.setState({error: 'Fill in all fields'});
    else {
      this.props.login(this.state.username.toLowerCase(), this.state.password);
      this.setState({error: '', username: '', password: ''});
    }
  };
  render() {
    return (
      <SafeAreaView style={styles.container}>
        <ScrollView>
          <View style={styles.logo}>
            <Image
              source={require('../assets/logo.png')}
              style={styles.image}
              resizeMode="contain"
            />
          </View>
          <View style={styles.title}>
            <Text style={styles.titleText}>Login</Text>
            <Text style={styles.error}>{this.state.error}</Text>
          </View>
          <View style={styles.form}>
            <Text style={styles.field}>Username</Text>
            <TextInput
              autoCapitalize="none"
              onChangeText={(text) => {
                this.setState({...this.state, username: text});
              }}
              value={this.state.username}
              style={styles.input}
            />

            <Text style={styles.field}>Password</Text>
            <TextInput
              onChangeText={(text) => {
                this.setState({...this.state, password: text});
              }}
              value={this.state.password}
              style={styles.input}
              secureTextEntry
            />
            <View style={styles.button}>
              <Button
                color="white"
                title="Sign In!"
                onPress={this.handleSubmit}
              />
            </View>
            <View style={styles.button2}>
              <Button
                color={MAIN_COLOR}
                title="Don't have an account?"
                onPress={() => {
                  this.props.navigation.replace('Register');
                }}
              />
            </View>
          </View>
        </ScrollView>
      </SafeAreaView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    justifyContent: 'flex-end',
    flex: 1,
    backgroundColor: BG_COLOR,
    padding: 30,
  },
  logo: {alignItems: 'center'},
  image: {
    height: Dimensions.get('window').width - 250,
    width: Dimensions.get('window').width - 60,
    tintColor: MAIN_COLOR,
  },
  title: {
    flex: 1,
    alignItems: 'center',
  },
  titleText: {
    fontSize: 40,
    letterSpacing: 10,
    color: MAIN_COLOR,
  },
  form: {padding: 30},
  field: {
    fontSize: 17,
    paddingVertical: 8,
    color: MAIN_COLOR,
    fontWeight: '500',
  },
  input: {
    height: 50,
    paddingLeft: 10,
    borderRadius: 30,
    borderColor: MAIN_COLOR,
    borderWidth: 2,
    fontSize: 18,
    marginBottom: 7,
    marginBottom: 20,
  },
  button: {
    marginHorizontal: 50,
    marginVertical: 20,
    paddingVertical: 8,
    backgroundColor: MAIN_COLOR,
    borderRadius: 30,
  },
  button2: {
    marginHorizontal: 50,
    paddingVertical: 8,
    borderRadius: 30,
  },
  error: {
    color: ERROR_RED,
  },
});
const mapStateToProps = (state) => ({});
export default connect(mapStateToProps, {login})(LoginPage);
