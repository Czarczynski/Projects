import React, {Component, Fragment} from 'react';
import {connect} from 'react-redux';
import PropTypes from 'prop-types';
import Snackbar from 'react-native-snackbar';
import {View} from 'react-native';
import {ERROR_RED} from '../common/config';

class Alerts extends Component {
  static propTypes = {
    error: PropTypes.object.isRequired,
    message: PropTypes.object.isRequired,
  };

  componentDidUpdate(prevProps) {
    const {error, message} = this.props;
    if (error !== prevProps.error) {
      if (error.msg.no_internet)
        Snackbar.show({
          text: 'Service is currently unavailable',
          textColor: ERROR_RED,
        });
      if (error.msg.car)
        Snackbar.show({
          text: 'There was an error. Please select the car again.',
          textColor: ERROR_RED,
        });
      if (error.msg.start_date)
        Snackbar.show({
          text: 'Select the proper starting date.',
          textColor: ERROR_RED,
        });
      if (error.msg.end_date)
        Snackbar.show({
          text: 'Select the proper ending date.',
          textColor: ERROR_RED,
        });
      if (error.msg.purpose)
        Snackbar.show({
          text:
            'Please fill the purpose field. It should be between 1 to 32 characters.',
          textColor: ERROR_RED,
        });
      if (error.msg.non_field_errors)
        Snackbar.show({
          text: 'Wrong username or password was given',
          textColor: ERROR_RED,
        });
      if (error.msg.comment)
        Snackbar.show({
          text: 'Comment field cannot be empty',
          textColor: ERROR_RED,
        });
      if (error.msg.username) {
        Snackbar.show({text: error.msg.username.join(), textColor: ERROR_RED});
      }
    }

    if (message !== prevProps.message) {
      if (message.invalidDate)
        Snackbar.show({text: message.invalidDate, textColor: ERROR_RED});
      if (message.reservationAdded)
        Snackbar.show({text: message.reservationAdded, textColor: 'green'});
      if (message.reservationDeleted)
        Snackbar.show({
          text: 'Reservation moved to the archive',
          textColor: 'green',
        });
      if (message.passwordNotMatch)
        Snackbar.show({text: message.passwordNotMatch, textColor: ERROR_RED});
      if (message.carRented)
        Snackbar.show({text: message.carRented, textColor: 'green'});
      if (message.wrongUser)
        Snackbar.show({text: message.wrongUser, textColor: ERROR_RED});
      if (message.archiveAdded)
        Snackbar.show({text: message.archiveAdded, textColor: 'green'});
      if (message.invalidPassword)
        Snackbar.show({text: message.invalidPassword, textColor: ERROR_RED});
      if (message.invalidEndDate)
        Snackbar.show({text: message.invalidEndDate, textColor: ERROR_RED});
      if (message.invalidStartDate)
        Snackbar.show({text: message.invalidStartDate, textColor: ERROR_RED});
      if (message.modalDismiss)
        Snackbar.show({text: message.modalDismiss, textColor: 'green'});
    }
  }
  render() {
    return <View></View>;
  }
}

const mapStateToProps = (state) => ({
  error: state.errors,
  message: state.messages,
});

export default connect(mapStateToProps)(Alerts);
