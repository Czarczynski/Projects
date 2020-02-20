import React from "react";
import "./App.css";
import {ToDoList} from './components/ToDoList'
import {FirstUseEffect} from './components/FirstUseEffect'
import {FirstAPI} from './components/FirstAPI'
import {RenderProps} from './components/RenderProps'
function App() {
  return (
    <div className="App" >
      <ToDoList />
      <FirstUseEffect />
      <FirstAPI />
      <RenderProps />
    </div>
  );
}

export default App;