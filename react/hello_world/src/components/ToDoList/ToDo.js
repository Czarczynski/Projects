import React from 'react';

function ToDo({todo, onCloseClick}){
    return(
        <div>
           <span> {todo}</span>
           <button className="close" onClick={()=>onCloseClick(todo)}>X</button>
        </div>
    );
}

export default ToDo;