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
  TextInput,
  KeyboardAvoidingView,
  ImageBackground,
} from 'react-native';
import {connect} from 'react-redux';
import {BG_COLOR, MAIN_COLOR, ERROR_RED, SMOKE_WHITE} from '../common/config';
import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';
import {faEnvelope, faLock, faUser} from '@fortawesome/free-solid-svg-icons';
import styles from '../assets/styles/formStyles';
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
      <KeyboardAvoidingView
        style={{flex: 1}}
        behavior={Platform.OS == 'ios' ? 'padding' : 'height'}>
        <ImageBackground
          source={null}
          style={{
            flex: 1,
            resizeMode: 'cover',
            justifyContent: 'center',
          }}>
          <ScrollView
            style={{backgroundColor: BG_COLOR}}
            contentContainerStyle={{flexGrow: 1}}
            keyboardShouldPersistTaps="handled">
            <SafeAreaView style={{...styles.container}}>
              <View style={styles.title}>
                <Text style={styles.titleText}>Register</Text>
              </View>
              <View style={styles.logo}>
                <Text style={styles.error}>{this.state.error}</Text>
              </View>
              <View style={styles.form}>
                <View style={styles.item}>
                  <Text style={styles.field}>Email</Text>
                  <View style={{flexDirection: 'row', alignItems: 'center'}}>
                    <FontAwesomeIcon icon={faEnvelope} color={MAIN_COLOR} />
                    <TextInput
                      textContentType="emailAddress"
                      onSubmitEditing={() => {
                        this.secondTextInput.focus();
                      }}
                      blurOnSubmit={false}
                      keyboardType="email-address"
                      returnKeyType="next"
                      autoCapitalize="none"
                      onChangeText={(text) => {
                        this.setState({...this.state, email: text});
                      }}
                      value={this.state.email}
                      style={styles.input}
                    />
                  </View>
                </View>
                <View style={styles.item}>
                  <Text style={styles.field}>Username</Text>
                  <View style={{flexDirection: 'row', alignItems: 'center'}}>
                    <FontAwesomeIcon icon={faUser} color={MAIN_COLOR} />
                    <TextInput
                      textContentType="username"
                      returnKeyType="next"
                      onSubmitEditing={() => {
                        this.thirdTextInput.focus();
                      }}
                      blurOnSubmit={false}
                      ref={(input) => {
                        this.secondTextInput = input;
                      }}
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
                      returnKeyType="next"
                      onSubmitEditing={() => {
                        this.fourthTextInput.focus();
                      }}
                      blurOnSubmit={false}
                      ref={(input) => {
                        this.thirdTextInput = input;
                      }}
                      autoCapitalize="none"
                      secureTextEntry
                      onChangeText={(text) => {
                        this.setState({...this.state, password: text});
                      }}
                      value={this.state.password}
                      style={styles.input}
                    />
                  </View>
                </View>
                <View style={styles.item}>
                  <Text style={styles.field}>Confirm password</Text>
                  <View style={{flexDirection: 'row', alignItems: 'center'}}>
                    <FontAwesomeIcon icon={faLock} color={MAIN_COLOR} />
                    <TextInput
                      textContentType="password"
                      returnKeyType="send"
                      ref={(input) => {
                        this.fourthTextInput = input;
                      }}
                      onSubmitEditing={this.handleSubmit}
                      autoCapitalize="none"
                      secureTextEntry
                      onChangeText={(text) => {
                        this.setState({...this.state, password2: text});
                      }}
                      value={this.state.password2}
                      style={styles.input}
                    />
                  </View>
                </View>
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
                    title="Sign In"
                    onPress={() => {
                      this.props.navigation.replace('Login');
                    }}
                  />
                </View>
              </View>
            </SafeAreaView>
          </ScrollView>
        </ImageBackground>
      </KeyboardAvoidingView>
    );
  }
}
const mapStateToProps = (state) => ({});
export default connect(mapStateToProps, {register})(LoginPage);
