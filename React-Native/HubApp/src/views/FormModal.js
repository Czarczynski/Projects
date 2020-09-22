import React from 'react';
import {Component} from 'react';
import PropTypes from 'prop-types';
import OutterStyles from '../assets/styles/formStyles';
import {
  Button,
  Dimensions,
  SafeAreaView,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import {
  faPen,
  faPenFancy,
  faTextHeight,
  faUser,
} from '@fortawesome/free-solid-svg-icons';
import {TextInput} from 'react-native-gesture-handler';
import {Picker} from '@react-native-community/picker';
import CalendarPicker from 'react-native-calendar-picker';
import {MAIN_COLOR, SMOKE_WHITE, CAR_CHOICES, BG_COLOR} from '../common/config';
import {connect} from 'react-redux';
import {addReservations} from '../actions/reservations';
import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';

class FormModal extends Component {
  state = {
    car: 'Skoda Superb',
    start_date: null,
    end_date: null,
    purpose: '',
    owner: 1,
    formValid: false,
    endDateValid: false,
    startDateValid: false,
  };
  static propTypes = {
    auth: PropTypes.object.isRequired,
  };

  // field validator
  validateField(fieldName, value) {
    let startDateValid = this.state.startDateValid;
    let endDateValid = this.state.endDateValid;

    switch (fieldName) {
      case 'start_date':
        // check if start_date is atleast today's date
        var d = new Date();
        var today = d.toISOString().substring(0, 16);

        if (value > today) {
          this.setState({
            start_date: value,
          });
          startDateValid = true;
        }

        break;
      case 'end_date':
        // check if end_date is atleast today's date
        var d = new Date();
        var today = d.toISOString().substring(0, 16);

        if (value > today && value > this.state.start_date) {
          endDateValid = true;
        }
        break;
    }
    this.setState(
      {
        endDateValid: endDateValid,
        startDateValid: startDateValid,
      },
      this.validateForm,
    );
  }

  validateForm() {
    this.setState({
      formValid: this.state.endDateValid && this.state.startDateValid,
    });
  }

  // onSubmit function that is run when form is submitted
  onSubmit = () => {
    const {id} = this.props.auth.user;

    this.setState({owner: id});

    // map state to variables and create reservation object
    const {car, start_date, end_date, purpose, owner} = this.state;
    const reservation = {car, start_date, end_date, purpose, owner};

    if (this.state.formValid) {
      this.props.addReservations(reservation);
      this.setState({
        car: 'Skoda Superb',
        start_date: new Date().toISOString().substring(0, 16),
        // start_date: new Date(),
        end_date: new Date().toISOString().substring(0, 16),
        purpose: '',
        owner: id,
      });
    } else {
      this.props.createMessage({
        invalidDate: 'Select proper starting or ending date.',
      });
    }
  };
  onDateChange(date, type) {
    if (type === 'END_DATE') {
      this.setState(
        {
          end_date: date ? date.toISOString().substring(0, 16) : null,
        },
        () => this.validateField('end_date', this.state.end_date),
      );
    } else {
      this.setState(
        {
          end_date: null,
          start_date: date ? date.toISOString().substring(0, 16) : null,
        },
        () => this.validateField('start_date', this.state.start_date),
      );
    }
    console.log({STAN: {...this.state}});
    console.log({DANE_DATY: {date, type}});
  }

  render() {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    return (
      <SafeAreaView style={styles.modal}>
        <View style={styles.appBar}>
          <Text style={styles.title}>New reservation</Text>

          <Button
            title="Leave"
            color={SMOKE_WHITE}
            onPress={() => this.props.navigation.goBack()}
          />
        </View>
        <ScrollView style={styles.content}>
          <View style={OutterStyles.item}>
            <Text style={OutterStyles.field}>Car</Text>
            <View style={{flexDirection: 'row', alignItems: 'center'}}>
              <Picker
                selectedValue={this.state.car}
                style={styles.selectInput}
                itemStyle={styles.selectItem}
                onValueChange={(text) => {
                  this.setState({...this.state, car: text});
                }}>
                {CAR_CHOICES.map((item) => (
                  <Picker.Item
                    key={item.value}
                    label={item.label}
                    value={item.value}
                  />
                ))}
              </Picker>
            </View>
          </View>
          <View style={OutterStyles.item}>
            <Text style={OutterStyles.field}>
              Select reservation date range
            </Text>
            <View style={{flexDirection: 'column', alignItems: 'center'}}>
              <CalendarPicker
                selectedDayTextColor={BG_COLOR}
                selectedRangeStyle={{
                  backgroundColor: MAIN_COLOR,
                }}
                minDate={tomorrow}
                allowRangeSelection
                onDateChange={(date, type) => this.onDateChange(date, type)}
                width={Dimensions.get('window').width - 120}
                height={Dimensions.get('window').width - 120}
              />
            </View>
          </View>
          <View style={OutterStyles.item}>
            <Text style={OutterStyles.field}>Purpose</Text>
            <View style={{flexDirection: 'row', alignItems: 'center'}}>
              <FontAwesomeIcon icon={faPenFancy} color={MAIN_COLOR} />
              <TextInput
                multiline={true}
                autoCapitalize="none"
                onChangeText={(text) => {
                  this.setState({...this.state, purpose: text});
                }}
                value={this.state.purpose}
                style={OutterStyles.input}
              />
            </View>
          </View>
        </ScrollView>
        <View style={styles.button}>
          <Button title="Confirm" color={MAIN_COLOR} onPress={this.onSubmit} />
        </View>
      </SafeAreaView>
    );
  }
}

const styles = StyleSheet.create({
  modal: {
    backgroundColor: MAIN_COLOR,
    flex: 1,
  },
  content: {
    paddingHorizontal: 30,
  },
  appBar: {
    paddingHorizontal: 30,
    height: 80,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  title: {
    color: SMOKE_WHITE,
    fontWeight: '500',
    fontSize: 30,
  },
  selectInput: {
    flex: 1,
  },
  button: {
    alignSelf: 'center',
    backgroundColor: BG_COLOR,
    width: 120,
    marginTop: 10,
    borderRadius: 30,
    padding: 5,
  },
});

const mapStateToProps = (state) => ({
  auth: state.auth,
});
export default connect(mapStateToProps, {addReservations})(FormModal);
