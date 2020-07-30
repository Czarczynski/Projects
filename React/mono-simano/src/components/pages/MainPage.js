import React, { Component } from "react";
import { connect } from "react-redux";
import { getCategories } from "../../actions/categories";

import classNames from "classnames";
import { makeStyles, withStyles } from "@material-ui/core/styles";
import PropTypes from "prop-types";

import styles from "../../styles/appPageStyle";
import { Title } from "../../styles/extStyles";
import "../../styles/fullpage.css";
import image from "../../images/landing-bg.jpg";

import Footer from "../layout/Footer.js";
import HeaderLinks from "../layout/HeaderLinks";
import Header from "../layout/Header";
import Parallax from "../layout/Parallax.js";
import CategoryItem from "../CategoryItem";
import GridContainer from "../layout/GridContainer";

export class MainPage extends Component {
  static propTypes = {
    categories: PropTypes.array.isRequired,
    classes: PropTypes.object.isRequired,
  };

  componentDidMount() {
    this.props.getCategories();
  }

  render() {
    const { classes } = this.props;
    return (
      <>
        <Header
          color={"transparent"}
          brand="MANO - SIMANO "
          rightLinks={<HeaderLinks />}
          fixed
          changeColorOnScroll={{
            height: 300,
            color: "white",
          }}
        />

        <Parallax filter image={image} />
        <div className={classNames(classes.main, classes.mainRaised)}>
          <div className={classes.container}>
            <Title>Categories</Title>
            <GridContainer>
              {this.props.categories.map((category) => (
                <CategoryItem data={category} />
              ))}
            </GridContainer>
          </div>
        </div>
        <Footer />
      </>
    );
  }
}

const mapStateToProps = (state) => ({
  categories: state.categories.categories,
});

export default connect(mapStateToProps, { getCategories })(
  withStyles(styles)(MainPage),
);
