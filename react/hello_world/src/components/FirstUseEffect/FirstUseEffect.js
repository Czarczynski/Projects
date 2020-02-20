import React, {useEffect, useState} from 'react'

function FirstUseEffect(){
    const [myFood, setMyFood] = useState("");
    useEffect(()=>{
        console.log(`What would I eat today: ${myFood}`)
        return()=> console.log("No, I was wrong") 
    },[myFood])
    
    return(
        <div style={{backgroundColor:"#BBB"}}>
            <h4>First useEffect</h4>
            <button
                onClick={() => {
                let myNewFood = "pizza"
                if(myFood === "pizza"){
                    myNewFood= "spaghetti"
                }

                setMyFood(myNewFood);
                }}
            >
                Button
            </button><br />
            {myFood}
      </div>
    );
}

export default FirstUseEffect;