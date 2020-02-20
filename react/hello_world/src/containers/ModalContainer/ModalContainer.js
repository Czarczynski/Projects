import {useState} from 'react';

function ModalContainer({defaultIsOpen, children}){
    const [isOpen, setIsOpen] = useState(defaultIsOpen); 
    const handleToggle = () => setIsOpen (!isOpen);
    
    return(
       children({isOpen, handleToggle}) 
    )
}


export default ModalContainer; 