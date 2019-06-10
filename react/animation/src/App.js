import React, { Component } from 'react';
import './App.css';
import {Transition, animate} from 'react-spring/renderprops'
import Components1 from './components/Components1'
import Components2 from './components/Components2'
import Components3 from './components/Components3'

export class App extends Component {
  state ={
    showComponent3: false
  }
  toggle = e => this.setState({showComponent3: !this.state.showComponent3})
  render() {
    return (
      <div className="App">
        <Components1 />
        <Components2 toggle={this.toggle} />
        <Transition
          native
          items={this.state.showComponent3}
          form={{opacity:0}}
          enter={{opacity:1}}
          leave={{opacity:0}}
        ></Transition>
      </div>
    )
  }
}

export default App