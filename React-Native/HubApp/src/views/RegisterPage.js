import React, {Component} from 'react';
import {register} from '../actions/auth';
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
import {BG_COLOR, MAIN_COLOR, ERROR_RED} from '../common/config';

class LoginPage extends Component {
  state = {
    email: '',
    username: '',
    password2: '',
    password: '',
    error: '',
  };

  handleSubmit = () => {
    if (
      this.state.email === '' ||
      this.state.username === '' ||
      this.state.password2 === '' ||
      this.state.password === ''
    )
      this.setState({error: 'Fill in all fields'});
    else {
      if (this.state.password !== this.state.password2)
        this.setState({error: 'Passwords are different'});
      else {
        this.props.register(this.state);
        this.setState({
          error: '',
          username: '',
          password: '',
          email: '',
          password2: '',
        });
      }
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
            <Text style={styles.titleText}>Register</Text>
            <Text style={styles.error}>{this.state.error}</Text>
          </View>
          <View style={styles.form}>
            <Text style={styles.field}>Email</Text>
            <TextInput
              type="email"
              onChangeText={(text) => {
                this.setState({...this.state, email: text});
              }}
              style={styles.input}
              value={this.state.email}
            />

            <Text style={styles.field}>Username</Text>
            <TextInput
              onChangeText={(text) => {
                this.setState({...this.state, username: text});
              }}
              style={styles.input}
              value={this.state.username}
            />

            <Text style={styles.field}>Password</Text>
            <TextInput
              onChangeText={(text) => {
                this.setState({...this.state, password2: text});
              }}
              value={this.state.password2}
              style={styles.input}
              secureTextEntry
            />

            <Text style={styles.field}>Confirm password</Text>
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
                title="Sign Up!"
                onPress={this.handleSubmit}
              />
            </View>
            <View style={styles.button2}>
              <Button
                color={MAIN_COLOR}
                title="Already have an account?"
                onPress={() => {
                  this.props.navigation.replace('Login');
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
    paddingBottom: 8,
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
    paddingVertical: 0,
    borderRadius: 30,
  },
  error: {
    color: ERROR_RED,
  },
});
const mapStateToProps = (state) => ({});
export default connect(mapStateToProps, {register})(LoginPage);
