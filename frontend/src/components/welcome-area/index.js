
import React from 'react';
import AnchorLink from 'react-anchor-link-smooth-scroll'
// import { Button, Modal, ModalHeader, ModalBody, ModalFooter } from 'reactstrap';
import './style.css'

const Welcome = (props) => {
  //   const {
  //     className
  //   } = props;

  //   const [modal, setModal] = useState(false);

  //   const toggle = () => setModal(!modal);

  return (

    <div className={`welcome-area ${props.welcome}`}>
      <div className="container">
        <div className="row">
          <div className="col-lg-12">
            <div className="welcome-content">
              <h2>Welcome to our big day</h2>
              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or less normal distribution of letters</p>
              <div className="btn"><AnchorLink href='#rsvp'>Rsvp</AnchorLink></div>
              <div className="btn"><AnchorLink href='#event'>Location</AnchorLink></div>
              {/* <Button className="btn" onClick={toggle}>Location</Button>
              <Modal isOpen={modal} toggle={toggle} className={className}>
                  <ModalHeader toggle={toggle}>Location</ModalHeader>
                  <ModalBody>
                      <div className="location-map">
                          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.3426562955387!2d106.80895501544052!3d-6.349661563890331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69ee84b089db19%3A0x437f76757cbe52bb!2sSanggar%20DeBatavia!5e0!3m2!1sen!2ssg!4v1659056375757!5m2!1sen!2ssg" />
                      </div>
                  </ModalBody>
              </Modal> */}
            </div>
          </div>
        </div>
      </div>
    </div>

  );
}

export default Welcome;