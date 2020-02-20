import React, { Fragment } from 'react'


function Modal({children, isOpen }){
    if(!isOpen){
        return null;
    }
    return(
        <Fragment>
            <div className="Overlay"></div>
            <div className="Modal">{children}</div>
        </Fragment >
    )
}

export default Modal; 