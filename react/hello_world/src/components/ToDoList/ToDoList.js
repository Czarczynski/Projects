import React, { useState } from 'react';
import ToDo from './ToDo';

function ToDoList(props){
    const [toDoListState, setToDoListState] = useState({todos: [], inputValue: "", error:""})
    const handleInputChange = (event) => {
        const {value} = event.target;
        setToDoListState({
            ...toDoListState,
            inputValue: value,
            error: ""
        })
    }
    const handleButtonClick = () => {
        if(!inputValue)
            return;
        const {todos} = toDoListState;
        if(todos.some(todo => todo === inputValue))
        {

            setToDoListState({
                ...toDoListState,
                error:"Already exists",
                inputValue:""
            })

        }
        else
        setToDoListState({
            todos: [...todos, inputValue],
            inputValue: "",
            error:""
        });
    }

    const handleToDoRemove = (todoValue) =>{
        setToDoListState({
            ...toDoListState,
            todos: todos.filter(todo => todo !== todoValue)
        })
    }
const {error, todos, inputValue} = toDoListState;
    error && alert(error);
    return(
        <div style={{background:"#AAA"}}>
            <h4>ToDo</h4>
            <input value ={inputValue} onChange={handleInputChange} name='toDoInput' placeholder="New Task"/>
            <button onClick={handleButtonClick}>Add</button>
            {todos.map((todo, i)=> (
                <ToDo 
                    key={i}
                    todo={todo}
                    onCloseClick={handleToDoRemove}
                />
            ))}
        </div>
    );
}

export default ToDoList;