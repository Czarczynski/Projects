import {faComment, faPenFancy, faRoad} from '@fortawesome/free-solid-svg-icons';
import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';
import {Picker} from '@react-native-community/picker';
import React, {Component} from 'react';
import {
  View,
  Text,
  StyleSheet,
  Modal,
  KeyboardAvoidingView,
  Button,
  ScrollView,
  TextInput,
  Keyboard,
  Dimensions,
} from 'react-native';
import {connect} from 'react-redux';
import {createMessage} from '../actions/messages';
import {deleteReservations} from '../actions/reservations';
import {addArchive} from '../actions/archive';
import OutterStyles from '../assets/styles/formStyles';
import {
  BG_COLOR,
  FUEL_AND_GAS,
  MAIN_COLOR,
  SMOKE_WHITE,
  TEXT_COLOR,
} from '../common/config';
class PopUpForm extends Component {
  state = {
    car: this.props.item.car,
    start_date: this.props.item.start_date
      .replace(' ', 'T')
      .replace(/\./g, '-'),
    end_date: new Date().toISOString().substring(0, 16),
    purpose: this.props.item.purpose,
    owner: this.props.item.owner,
    fuel: '1/4',
    comment: '',
    mileage: '0',
  };
  state2 = {
    visible2: true,
  };
  goToInput = () => {
    this.input.scrollTo({
      x: 0,
      y: Dimensions.get('window').height,
      animated: true,
    });
  };

  onSubmit = () => {
    if (this.props.addArchive(this.state)) {
      this.props.deleteReservations(this.props.item.id);
      this.props.dismiss();
    }
  };
  render() {
    const {children, visible, createMessage} = this.props;
    return (
      <Modal
        animationType="slide"
        transparent={true}
        visible={visible}
        onRequestClose={() => {
          createMessage({modalDismiss: 'Dismissed'});
        }}>
        <View style={styles.centeredView}>
          <View style={styles.modalView}>
            <View style={styles.appBar}>
              <Text style={styles.title}>Hand over</Text>
              {children}
            </View>
            <KeyboardAvoidingView
              enabled
              keyboardVerticalOffset={50}
              style={{
                flexDirection: 'column',
                justifyContent: 'center',
                width: Dimensions.get('window').width * 0.7,
              }}
              behavior={Platform.OS == 'ios' ? 'padding' : 'height'}>
              <ScrollView
                style={styles.content}
                ref={(c) => {
                  this.input = c;
                }}>
                <View style={OutterStyles.item}>
                  <Text style={OutterStyles.field}>Fuel</Text>
                  <View style={{flexDirection: 'row', alignItems: 'center'}}>
                    <Picker
                      selectedValue={this.state.fuel}
                      style={styles.selectInput}
                      itemStyle={styles.selectItem}
                      onValueChange={(text) => {
                        this.setState({...this.state, fuel: text, gas: text});
                        console.log({miles: this.state.mileage});
                      }}>
                      {FUEL_AND_GAS.map((item) => (
                        <Picker.Item
                          key={item.value}
                          label={item.value}
                          value={item.value}
                        />
                      ))}
                    </Picker>
                  </View>
                </View>
                <View style={OutterStyles.item}>
                  <Text style={OutterStyles.field}>
                    Distance you've traveled
                  </Text>
                  <View style={{flexDirection: 'row', alignItems: 'center'}}>
                    <FontAwesomeIcon icon={faRoad} color={MAIN_COLOR} />
                    <TextInput
                      keyboardType="numeric"
                      returnKeyType="next"
                      onSubmitEditing={Keyboard.dismiss}
                      onFocus={this.goToInput}
                      maxLength={32}
                      autoCapitalize="none"
                      onChangeText={(text) => {
                        this.setState({...this.state, mileage: text});
                      }}
                      value={this.state.mileage}
                      style={OutterStyles.input}
                    />
                    <Text style={OutterStyles.field}>km</Text>
                  </View>
                </View>
                <View style={OutterStyles.item}>
                  <Text style={OutterStyles.field}>Comment</Text>
                  <View style={{flexDirection: 'row', alignItems: 'center'}}>
                    <FontAwesomeIcon icon={faComment} color={MAIN_COLOR} />
                    <TextInput
                      onSubmitEditing={Keyboard.dismiss}
                      onFocus={this.goToInput}
                      maxLength={32}
                      autoCapitalize="none"
                      onChangeText={(text) => {
                        this.setState({...this.state, comment: text});
                      }}
                      value={this.state.comment}
                      style={OutterStyles.input}
                    />
                  </View>
                </View>
              </ScrollView>
            </KeyboardAvoidingView>
            <View style={styles.button}>
              <Button
                title="Confirm"
                color={MAIN_COLOR}
                onPress={this.onSubmit}
              />
            </View>
          </View>
        </View>
      </Modal>
    );
  }
}
const styles = StyleSheet.create({
  centeredView: {
    justifyContent: 'center',
    alignItems: 'center',
    alignSelf: 'center',
    marginTop: 100,
  },
  modalView: {
    marginVertical: 20,
    backgroundColor: 'white',
    borderRadius: 20,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 50.84,
    elevation: 5,
  },
  modalText: {
    marginBottom: 15,
    textAlign: 'center',
  },
  appBar: {
    height: 80,
    width: 300,
    paddingHorizontal: 30,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  title: {
    color: TEXT_COLOR,
    fontWeight: '500',
    fontSize: 30,
  },
  content: {
    paddingHorizontal: 20,
    paddingBottom: 20,
  },
  selectInput: {
    flex: 1,
    height: 100,
  },
  selectItem: {
    height: 100,
  },
  button: {
    alignSelf: 'center',
    backgroundColor: BG_COLOR,
    width: 120,
    marginBottom: 30,
    borderRadius: 30,
    padding: 5,
  },
});
const mapStateToProps = (state) => ({
  auth: state.auth,
});
export default connect(mapStateToProps, {
  createMessage,
  deleteReservations,
  addArchive,
})(PopUpForm);
