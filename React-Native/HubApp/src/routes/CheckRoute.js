import React, {Component} from 'react';
import PrivateNavigation from './PrivateNavigation';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import Navigation from './Navigation';

class CheckRoute extends Component {
  static propTypes = {
    auth: PropTypes.any,
  };

  render() {
    if (this.props.auth.isAuthenticated) return <Navigation />;
    else return <PrivateNavigation />;
  }
}

const mapStateToProps = (state) => ({
  auth: state.auth,
});

export default connect(mapStateToProps)(CheckRoute);
