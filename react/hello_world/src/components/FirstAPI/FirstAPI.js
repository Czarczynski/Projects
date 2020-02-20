import React, { useState, useEffect, useReducer } from "react";
import { Modal } from "../Modal";
import "../RenderProps/Modal.css";
import { ModalContainer } from "../../containers/ModalContainer";

function dataFetchReducer(state, action) {
  switch (action.type) {
    case "FETCH_START":
      return { ...state, loading: true };
    case "FETCH_SUCCESS":
      return {
        data: action.data,
        loading: false,
        error: null
      };
    case "FETCH_FAILED":
      return {
        data: null,
        loading: false,
        error: action.error
      };
    default:
      break;
  }
}

function FirstAPI() {
  const [person, setPerson] = useState(1);
  const [state, dispatch] = useReducer(dataFetchReducer, {
    data: null,
    error: null,
    loading: true
  });

  useEffect(() => {
    const myFetch = async () => {
      dispatch({ type: "FETCH_START" });
      try {
        fetch(`https://jsonplaceholder.typicode.com/users/${person}`)
          .then(function(response) {
            return response.json();
          })
          .then(function(x) {
            dispatch({
              type: "FETCH_SUCCESS",
              data: x,
              loading: false,
              error: "ERROR"
            });
          });
      } catch (error) {
        dispatch({
          type: "FETCH_FAILED",
          error: "error"
        });
      }
    };
    myFetch();
  }, [person]);
  return (
    <div style={{ background: "#CCC" }}>
      <h4>First API</h4>
      <button
        onClick={() => {
          if (person === 1) return alert("This is earliest person");
          setPerson(person - 1);
        }}
      >
        Previous Person
      </button>
      <button
        onClick={() => {
          if (person === 10) return alert("This is last person");
          setPerson(person + 1);
        }}
      >
        Next Person
      </button>
      <br />
      <br />
      Id: {person}
      <br />
      <br />
      {state.loading ? <p>loading...</p> : <Inside children={state.data} />}
    </div>
  );
}

function Inside(props) {
  return (
    <ModalContainer>
      {({ isOpen, handleToggle }) => (
        <div onClick={handleToggle}>
          <b>Name:</b> {props.children["name"]}
          <br />
          <br />
          <b>Email:</b> {props.children["email"]}
          <br />
          {!isOpen ? <p style={{ paddingBottom: "10px" }}>...</p> : <p></p>}
          <Modal isOpen={isOpen}>
            <div className="Card">
              <div className="Card_content">
                <b>Username: </b> {props.children["username"]}
              </div>
            </div>
            <br />
            <div className="Card">
              <div className="Card_content">
                <b>Address: </b> {props.children["address"]["city"]},{" "}
                {props.children["address"]["street"]}
              </div>
            </div>
            <br />
          </Modal>
        </div>
      )}
    </ModalContainer>
  );
}

export default FirstAPI;
