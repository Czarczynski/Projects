/*eslint-disable*/
import React from "react";
// react components for routing our app without refresh
import classNames from "classnames";

// @material-ui/core components
import { makeStyles } from "@material-ui/core/styles";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";

// @material-ui/icons

// core components
import Button from "../Button.js";

import styles from "../../styles/headerLinksStyle.js";

const useStyles = makeStyles(styles);

export default function HeaderLinks() {
  const classes = useStyles();
  return (
    <List className={classes.list}>
      <ListItem className={classes.listItem}>
        <Button
          to="/events"
          color="transparent"
          className={classes.navLink}
          size="lg"
        >
          Events
        </Button>
      </ListItem>
      <ListItem className={classes.listItem}>
        <Button
          to="/categories"
          color="transparent"
          className={classes.navLink}
          size="lg"
        >
          Categories
        </Button>
      </ListItem>
      <ListItem className={classes.listItem}>
        <Button
          to="/about"
          color="transparent"
          className={classes.navLink}
          size="lg"
        >
          Contact
        </Button>
      </ListItem>
      <ListItem className={classNames(classes.listItem, classes.frontBtn)}>
        <Button
          to="/login"
          color="primary"
          className={classes.navLink}
          size="lg"
        >
          Login
        </Button>
      </ListItem>
      <ListItem className={classNames(classes.listItem)}>
        <Button
          to="/register"
          color="transparent"
          className={classes.navLink}
          size="lg"
        >
          Register
        </Button>
      </ListItem>
    </List>
  );
}
