import React, {Component} from 'react';
import {
  SafeAreaView,
  Text,
  StyleSheet,
  View,
  Dimensions,
  ScrollView,
  TouchableOpacity,
} from 'react-native';
import {connect} from 'react-redux';
import PropTypes from 'prop-types';
import {BG_COLOR, MAIN_COLOR, SMOKE_WHITE} from '../common/config';
import {getReservations} from '../actions/reservations';
import Card from '../components/Card';

import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';
import {faPlus} from '@fortawesome/free-solid-svg-icons';

class Dashboard extends Component {
  static propTypes = {
    auth: PropTypes.object.isRequired,
    reservations: PropTypes.array.isRequired,
  };

  componentDidMount() {
    this.props.getReservations();
  }
  componentDidUpdate() {
    if (!this.props.auth.isAuthenticated)
      this.props.navigation.replace('Login');
  }

  handleClick = () => {
    this.props.navigation.push('FormModal');
  };

  render() {
    const {user} = this.props.auth;
    const notActivated = this.props.reservations.filter((item) => !item.active);
    const activated = this.props.reservations.filter((item) => item.active);
    return (
      <View style={styles.view}>
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
        <TouchableOpacity
          style={styles.floatingButton}
          onPress={() => this.handleClick()}>
          <FontAwesomeIcon color={SMOKE_WHITE} size={20} icon={faPlus} />
        </TouchableOpacity>
      </View>
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
    color: MAIN_COLOR,
    fontSize: 30,
  },
  empty: {
    paddingVertical: 20,
    width: Dimensions.get('window').width - 20,
    textAlign: 'center',
    fontSize: 15,
    letterSpacing: 2,
  },
  floatingButton: {
    shadowColor: MAIN_COLOR,
    shadowOffset: {
      width: 0,
      height: 7,
    },
    shadowOpacity: 0.5,
    shadowRadius: 5,
    elevation: 50,
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 50,
    width: 50,
    height: 50,
    backgroundColor: MAIN_COLOR,
    position: 'absolute',
    bottom: 20,
    right: 20,
  },
});

const mapStateToProps = (state) => ({
  reservations: state.reservations.reservations,
  auth: state.auth,
});

export default connect(mapStateToProps, {
  getReservations,
})(Dashboard);
