import React from "react";
import { Modal } from "../Modal";
import "./Modal.css";
import { ModalContainer } from "../../containers/ModalContainer";

function RenderProps() {
  return (
    <ModalContainer>
      {({ isOpen, handleToggle }) => (
        <div className="modale"
          style={{ backgroundColor: "#DDD", marginTop: "20px" }}
          onClick={handleToggle}
        >
          <b className="b">Render Props</b>
          
            <Modal isOpen={isOpen}>
              <div className="Card">
                <div className="Card_content">Modalinek</div>
              </div>
            </Modal>
        </div>
      )}
    </ModalContainer>
  );
}

export default RenderProps;
