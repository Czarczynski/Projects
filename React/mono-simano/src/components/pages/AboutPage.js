import React, { Fragment } from "react";
import { makeStyles } from "@material-ui/core/styles";
import classNames from "classnames";

import styles from "../../styles/aboutPageStyle";
import Header from "../layout/Header";
import HeaderLinks from "../layout/HeaderLinks";
import Footer from "../layout/Footer";
const useStyles = makeStyles(styles);

export default function AboutPage() {
  const classes = useStyles();

  return (
    <Fragment>
      <Header
        color="transparent"
        brand="MANO - SIMANO "
        rightLinks={<HeaderLinks />}
        fixed
      />
      <div className={classes.pageHeader}>
        <div className={classNames(classes.mainRaised, classes.main)}>
          <div className={classes.container}>
            <div className="text-dark">It's about us section</div>
          </div>
        </div>
        <Footer />
      </div>
    </Fragment>
  );
}
