/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import Footer from '../../components/Footer';

describe('<Footer />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<Footer />);
    assert.strictEqual(wrapper.length, 1);

    const text = wrapper.find('p');
    assert.strictEqual(text.length, 1);
    assert.strictEqual(text.text(), 'Copyright: AppFolio Inc. Onboarding');
  });
});
