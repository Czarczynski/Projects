import React, { Component } from "react";
import { Link } from "react-router-dom";
import { connect } from "react-redux";
import PropTypes from "prop-types";
import { logout } from "../../actions/auth";

export class Header extends Component {
  static propTypes = {
    auth: PropTypes.object.isRequired,
    logout: PropTypes.func.isRequired,
  };
  render() {
    const { isAuthenticated, user } = this.props.auth;
    const authLinks = (
      <>
        <li className="nav-item">
          <button
            onClick={this.props.logout}
            className="nav-link btn btn-primary btn-sm pl-2 pr-2 text-white"
          >
            Log Out
          </button>
        </li>
      </>
    );
    const guestLinks = (
      <>
        <li className="nav-item">
          <Link className="nav-link text-white " to="/register">
            Register
          </Link>
        </li>
        <li className="nav-item">
          <Link
            className="nav-link btn btn-primary btn-sm pl-2 pr-2 text-white"
            to="/login"
          >
            Login
          </Link>
        </li>
      </>
    );
    return (
      <nav className="navbar navbar-expand-sm navbar-dark bg-secondary mb-5">
        <div className="container">
          <button
            className="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarTogglerDemo01"
            aria-controls="navbarTogglerDemo01"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a className="navbar-brand" href="#">
              Lead Manager
            </a>
            <span className="navbar-text text-white mr-auto">
              <strong>{user ? `Hello, ${user.username}` : ""}</strong>
            </span>
            <ul className="navbar-nav ml-auto mt-2 mt-lg-0">
              <li className="nav-item">
                <Link className="nav-link text-white" to="/about">
                  About us
                </Link>
              </li>
              {isAuthenticated ? authLinks : guestLinks}
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}
const mapStateToProps = (state) => ({
  auth: state.auth,
});

export default connect(mapStateToProps, { logout })(Header);
