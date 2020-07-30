import React, { Component } from "react";

import Events from "../Events";
import { Redirect } from "react-router-dom";

export default class EventsPage extends Component {
  render() {
    const { data } = this.props.location;

    if (data.events.length <= 0) return <Redirect to="/" />;
    return <Events data={data} />;
  }
}
