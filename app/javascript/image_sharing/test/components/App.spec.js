/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import App from '../../components/App';

describe('<App />', () => {
  it('should have 3 child components', () => {
    const wrapper = shallow(<App />);

    assert.strictEqual(wrapper.find('Container').children().length, 3);
    assert.strictEqual(wrapper.find('Header').length, 1);
    assert.strictEqual(wrapper.find('FeedbackForm').length, 1);
    assert.strictEqual(wrapper.find('Footer').length, 1);
  });
});
