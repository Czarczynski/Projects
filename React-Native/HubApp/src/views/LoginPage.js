import React, {Component} from 'react';
import {login} from '../actions/auth';
import {
  SafeAreaView,
  Text,
  View,
  Button,
  Image,
  TextInput,
  KeyboardAvoidingView,
} from 'react-native';
import {connect} from 'react-redux';
import {BG_COLOR, MAIN_COLOR} from '../common/config';
import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';
import {
  faEyeSlash,
  faLock,
  faUser,
  faEye,
} from '@fortawesome/free-solid-svg-icons';
import PropTypes from 'prop-types';
import {ScrollView, TouchableOpacity} from 'react-native-gesture-handler';
import styles from '../assets/styles/formStyles';

class LoginPage extends Component {
  static propTypes = {
    auth: PropTypes.any,
  };
  state = {
    username: '',
    password: '',
    error: '',
    passwordSecured: true,
  };
  handleSubmit = () => {
    if (this.state.username === '' || this.state.password === '')
      this.setState({error: 'Fill in all fields'});
    else {
      this.props.login(this.state.username.toLowerCase(), this.state.password);
      this.setState({
        ...this.state,
        error: '',
      });
    }
  };
  componentDidUpdate() {
    if (this.props.auth.isAuthenticated)
      this.props.navigation.replace('Dashboard');
  }
  render() {
    return (
      <KeyboardAvoidingView
        style={{flex: 1}}
        behavior={Platform.OS == 'ios' ? 'padding' : 'height'}>
        <ScrollView
          style={{backgroundColor: BG_COLOR}}
          contentContainerStyle={{flexGrow: 1}}
          keyboardShouldPersistTaps="handled">
          <SafeAreaView style={styles.container}>
            <View style={styles.title}>
              <Text style={styles.titleText}>Login</Text>
            </View>
            <View style={styles.logo}>
              <Image
                source={require('../assets/images/logo.png')}
                style={styles.image}
                resizeMode="cover"
              />
              <Text style={styles.error}>{this.state.error}</Text>
            </View>
            <View style={styles.form}>
              <View style={styles.item}>
                <Text style={styles.field}>Username</Text>
                <View style={{flexDirection: 'row', alignItems: 'center'}}>
                  <FontAwesomeIcon icon={faUser} color={MAIN_COLOR} />
                  <TextInput
                    textContentType="username"
                    onSubmitEditing={() => {
                      this.secondTextInput.focus();
                    }}
                    returnKeyType="next"
                    blurOnSubmit={false}
                    autoCapitalize="none"
                    onChangeText={(text) => {
                      this.setState({...this.state, username: text});
                    }}
                    value={this.state.username}
                    style={styles.input}
                  />
                </View>
              </View>
              <View style={styles.item}>
                <Text style={styles.field}>Password</Text>
                <View style={{flexDirection: 'row', alignItems: 'center'}}>
                  <FontAwesomeIcon icon={faLock} color={MAIN_COLOR} />
                  <TextInput
                    textContentType="password"
                    ref={(input) => {
                      this.secondTextInput = input;
                    }}
                    returnKeyType="send"
                    onSubmitEditing={this.handleSubmit}
                    autoCapitalize="none"
                    secureTextEntry={this.state.passwordSecured}
                    onChangeText={(text) => {
                      this.setState({...this.state, password: text});
                    }}
                    value={this.state.password}
                    style={styles.input}
                  />
                  <TouchableOpacity
                    onPress={() => {
                      this.setState({
                        ...this.state,
                        passwordSecured: !this.state.passwordSecured,
                      });
                    }}>
                    <FontAwesomeIcon
                      icon={!this.state.passwordSecured ? faEye : faEyeSlash}
                      style={{padding: 10, color: MAIN_COLOR}}
                    />
                  </TouchableOpacity>
                </View>
              </View>
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
                  title="Sign Up"
                  onPress={() => {
                    this.props.navigation.replace('Register');
                  }}
                />
              </View>
            </View>
          </SafeAreaView>
        </ScrollView>
      </KeyboardAvoidingView>
    );
  }
}

const mapStateToProps = (state) => ({auth: state.auth});
export default connect(mapStateToProps, {login})(LoginPage);
