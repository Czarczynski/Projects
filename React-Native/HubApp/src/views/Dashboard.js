import React, {Component} from 'react';
import {
  SafeAreaView,
  Text,
  StyleSheet,
  View,
  Button,
  Dimensions,
  ScrollView,
} from 'react-native';
import {connect} from 'react-redux';
import PropTypes from 'prop-types';
import {BG_COLOR, MAIN_COLOR} from '../common/config';
import {getReservations} from '../actions/reservations';
import Card from '../components/Card';

class Dashboard extends Component {
  static propTypes = {
    auth: PropTypes.object.isRequired,
    reservations: PropTypes.array.isRequired,
  };

  componentDidMount() {
    this.props.getReservations();
  }
  render() {
    const {user} = this.props.auth;
    const notActivated = this.props.reservations.filter((item) => !item.active);
    const activated = this.props.reservations.filter((item) => item.active);
    return (
      <SafeAreaView style={styles.view}>
        <ScrollView style={styles.container}>
          <Text style={styles.title}>Rented cars</Text>
          <View style={styles.section}>
            {activated.length === 0 ? (
              <Text style={styles.empty}>This section is empty ...</Text>
            ) : (
              activated.map((reservation) => (
                <Card
                  activated
                  key={reservation.id}
                  reservation={reservation}
                  user={user}
                />
              ))
            )}
          </View>
          <Text style={styles.title}>Your reservations</Text>
          <View style={styles.section}>
            {notActivated.length === 0 ? (
              <Text style={styles.empty}>This section is empty ...</Text>
            ) : (
              notActivated.map((reservation) => (
                <Card
                  key={reservation.id}
                  reservation={reservation}
                  user={user}
                />
              ))
            )}
          </View>
        </ScrollView>
      </SafeAreaView>
    );
  }
}

const styles = StyleSheet.create({
  view: {
    backgroundColor: BG_COLOR,
    flex: 1,
  },
  container: {
    padding: 10,
  },
  section: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    flex: 1,
    paddingBottom: 40,
  },
  title: {
    fontSize: 30,
  },
  empty: {
    paddingVertical: 20,
    width: Dimensions.get('window').width - 20,
    textAlign: 'center',
    fontSize: 15,
    letterSpacing: 2,
  },
});

const mapStateToProps = (state) => ({
  reservations: state.reservations.reservations,
  auth: state.auth,
});

export default connect(mapStateToProps, {
  getReservations,
})(Dashboard);
