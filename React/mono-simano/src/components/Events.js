import React from "react";
import { makeStyles } from "@material-ui/core";
import classNames from "classnames";

import GridContainer from "./layout/GridContainer.js";
import EventItem from "./EventItem.js";
import Header from "./layout/Header.js";
import HeaderLinks from "./layout/HeaderLinks.js";
import Parallax from "./layout/Parallax.js";
import Footer from "./layout/Footer.js";

import styles from "../styles/appPageStyle";
import { Title } from "../styles/extStyles";
import "../styles/fullpage.css";
import image from "../images/landing-bg.jpg";

const useStyles = makeStyles(styles);

export default function Events(props) {
  const classes = useStyles();
  const { category, events } = props.data;
  // const queryString = window.location.search;

  // const urlParams = new URLSearchParams(queryString);

  // const aa = urlParams.get("category");

  // console.log(aa);
  return (
    <div>
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
          <Title>Events of {category}</Title>

          <GridContainer>
            {events.map((event) => (
              <EventItem data={event} />
            ))}
          </GridContainer>
        </div>
      </div>
      <Footer />
    </div>
  );
}
