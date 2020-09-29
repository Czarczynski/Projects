import React from 'react';
import {Button, Dimensions, StyleSheet, Text, View} from 'react-native';
import {connect} from 'react-redux';
import {deleteReservations, addRental} from '../actions/reservations';
import {createMessage} from '../actions/messages';
import {MAIN_COLOR, SMOKE_WHITE} from '../common/config';
import {useState} from 'react/cjs/react.development';
import PopUpForm from './PopUpForm';
function Card({reservation, user, addRental, createMessage, activated}) {
  const [modalVisible, setModalVisible] = useState(false);

  return (
    <View key={reservation.id} style={styles.card}>
      <PopUpForm
        visible={modalVisible}
        item={reservation}
        dismiss={() => setModalVisible(false)}>
        <Button
          title="Hide"
          color={MAIN_COLOR}
          onPress={() => setModalVisible(false)}
        />
      </PopUpForm>
      <View style={styles.cardHeader}>
        <Text style={styles.cardTitle}>{reservation.car}</Text>
      </View>
      <View style={styles.cardBody}>
        <View
          style={{
            ...styles.dateField,
            borderRightWidth: 1,
            borderColor: '#ccc',
          }}>
          <Text>start:</Text>
          <Text style={styles.date}>{reservation.start_date}</Text>
        </View>
        <View style={styles.dateField}>
          <Text>end:</Text>
          <Text style={styles.date}>{reservation.end_date}</Text>
        </View>
      </View>
      <View>
        <Text style={styles.cardDesc}>{reservation.purpose}</Text>
      </View>
      <View style={styles.cardFooter}>
        {activated ? (
          <Button
            color="white"
            onPress={() => setModalVisible(true)}
            className="btn-success btn-sm btn"
            title="Return this car"
          />
        ) : (
          <Button
            color="white"
            onPress={() =>
              user.id == reservation.owner
                ? addRental(reservation.id)
                : createMessage({
                    wrongUser: "You can't rent other people's reservations.",
                  })
            }
            className="btn-success btn-sm btn"
            title="Rent"
          />
        )}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    margin: 10,
    // padding: 10,
    borderRadius: 20,
    width: Dimensions.get('window').width - 40,
    backgroundColor: SMOKE_WHITE,
    shadowOffset: {
      width: 0,
      height: 5,
    },
    shadowOpacity: 0.27,
    shadowRadius: 10.65,
  },
  cardTitle: {
    fontWeight: 'bold',
  },
  cardHeader: {
    alignItems: 'center',
    padding: 10,
    borderTopEndRadius: 20,
    borderTopStartRadius: 20,
    backgroundColor: SMOKE_WHITE,
  },
  cardBody: {
    flexDirection: 'row',
  },
  dateField: {
    width: Dimensions.get('screen').width / 2 - 20,
    alignItems: 'center',
    padding: 5,
  },
  date: {
    paddingTop: 10,
    fontWeight: '600',
  },
  cardDesc: {
    padding: 10,
    backgroundColor: SMOKE_WHITE,
  },
  cardFooter: {
    backgroundColor: MAIN_COLOR,
    borderBottomEndRadius: 20,
    borderBottomStartRadius: 20,
  },
  openButton: {
    backgroundColor: '#F194FF',
    borderRadius: 20,
    padding: 10,
    elevation: 2,
  },
  textStyle: {
    color: 'white',
    fontWeight: 'bold',
    textAlign: 'center',
  },
});
const mapStateToProps = (state) => ({});
export default connect(mapStateToProps, {
  deleteReservations,
  addRental,
  createMessage,
})(Card);
