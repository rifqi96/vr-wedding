import React from 'react';
import { Link } from 'react-router-dom'
import AnchorLink from 'react-anchor-link-smooth-scroll'
import 'react-sticky-header/styles.css';
import MobileMenu from '../../components/MobileMenu'
import logo from '../../images/logo.png';
import logoDark from '../../images/logo-dark.png';

import './style.css'

const Header = (props) => {

  const logoSrc = props.isActive ? logoDark : logo;

  return (

    <div className="Header_root">
      <div className="header">
        <div className="container">
          <div className="row">
            <div className="col-lg-3">
              <div className="logo">
                <Link to='/'><img src={logoSrc} /></Link>
              </div>
            </div>
            <div className="col-lg-9">
              <div className="header-menu d-lg-block d-none">
                <ul className="mobail-menu d-flex">
                  {/* <li><Link to='#home'>Home</Link>
                                        <ul className="submenu">
                                            <li><Link to='/home'>Home Style 1</Link></li>
                                            <li><Link to='/home2'>Home Style 2</Link></li>
                                            <li><Link to='/home3'>Home Style 3</Link></li>
                                            <li><Link to='/home4'>Home Style 4</Link></li>
                                            <li><Link to='/home5'>Home video</Link></li>
                                        </ul>
                                    </li> */}
                  <li><AnchorLink href='#home'>Home</AnchorLink></li>
                  <li><AnchorLink href='#rsvp'>Rsvp</AnchorLink></li>
                  {/* <li><AnchorLink href='#story'>Story</AnchorLink></li> */}
                  {/* <li><AnchorLink href='#people'>People</AnchorLink></li> */}
                  <li><AnchorLink href='#event'>Events</AnchorLink></li>
                  <li><AnchorLink href='#couple'>Couple</AnchorLink></li>
                  <li><AnchorLink href='#gallery'>Gallery</AnchorLink></li>
                  {/* <li><Link to='#'>Blog</Link>
                                        <ul className="submenu">
                                            <li><Link to='/blog'>Blog</Link></li>
                                            <li><Link to='/Blog-details'>Blog Details</Link></li>
                                        </ul>
                                    </li> */}
                </ul>
              </div>
            </div>
            <div className="col-12">
              <MobileMenu />
            </div>
          </div>
        </div>
      </div>
    </div>

  )
}

export default Header;
