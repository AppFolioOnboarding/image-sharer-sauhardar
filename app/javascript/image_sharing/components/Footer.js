import React from 'react';
import PropType from 'prop-types';

function Footer({ text }) {
  return (
    <div>
      <p style={{ fontSize: '0.7rem' }}>{text}</p>
    </div>
  );
}

Footer.propTypes = {
  text: PropType.string
};

Footer.defaultProps = {
  text: 'Copyright: AppFolio Inc. Onboarding'
};

export default Footer;

