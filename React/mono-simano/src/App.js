import React, { Fragment } from "react";
import "./App.css";

import { HashRouter as Router, Switch, Route } from "react-router-dom";
import { Provider as AlertProvider } from "react-alert";
import AlertTemplate from "react-alert-template-basic";
import { Provider } from "react-redux";
import store from "./store";
import MainPage from "./components/pages/MainPage";
import AboutPage from "./components/pages/AboutPage";
import LoginPage from "./components/pages/LoginPage";
import EventsPage from "./components/pages/EventsPage";
import { Alerts } from "./components/layout/Alerts";

const alertOptions = {
  timeout: 3000,
  position: "top center",
};

function App() {
  return (
    <div className="App">
      <Provider store={store}>
        <AlertProvider template={AlertTemplate} {...alertOptions}>
          <Router>
            <Fragment>
              <Alerts />
              <Switch>
                <Route exact path="/" component={MainPage} />
                <Route path="/login" component={LoginPage} />
                <Route path="/about" component={AboutPage} />
                <Route path="/events:category:id" component={EventsPage} />
              </Switch>
            </Fragment>
          </Router>
        </AlertProvider>
      </Provider>
    </div>
  );
}

export default App;
