
import React from 'react';
import { Button } from 'reactstrap';
import Sectiontitle from '../section-title'
// import strory1 from '../../images/events/img-1.jpg'
// import strory2 from '../../images/events/img-2.jpg'
// import strory3 from '../../images/events/img-3.jpg'

import './style.css'

const Location = (props) => {

  // const {
  //     className
  // } = props;

  // const [modal, setModal] = useState(false);

  // const toggle = () => setModal(!modal);

  return (
    <div id="event" className="event-section section-padding">
      <Sectiontitle section={'When & Where'} />
      <div className="container">
        <div className="row">
          <div className="col-12">
            <div className="tabs-site-button">
              <div className="event-tabs">
                <div className="col-md-12 col-12">
                  <div className="event-wrap">
                    <div className="row">
                      <div className="col-lg-7 col-md-12 col-12">
                        <div className="event-text event-text-2">
                          <h3>Wedding Venue</h3>
                          <span>Saturday, 13 August 22</span>
                          <span><strong>SANGGAR DEBATAVIA</strong>, Jl. Nurul Iman No. 52, RT.4/RW.5, Cipedak, Jagakarsa, Jakarta Selatan</span>
                        </div>
                      </div>
                      <div className="col-lg-5 col-md-12 col-12">
                        <div className="mapouter">
                          <div className="gmap_canvas">
                            <iframe width="100%" height="400" id="gmap_canvas" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.3426562955387!2d106.80895501544052!3d-6.349661563890331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69ee84b089db19%3A0x437f76757cbe52bb!2sSanggar%20DeBatavia!5e0!3m2!1sen!2ssg!4v1659056375757!5m2!1sen!2ssg" frameBorder="0" scrolling="no" marginHeight="0" marginWidth="0"></iframe>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
export default Location;