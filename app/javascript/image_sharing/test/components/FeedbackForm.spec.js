/* eslint-env mocha */

import assert from 'assert';
import { mount, shallow } from 'enzyme';
import React from 'react';
import FeedbackForm from '../../components/FeedbackForm';

describe('<FeedbackForm />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<FeedbackForm />);
    assert.strictEqual(wrapper.length, 1);

    const formGroups = wrapper.find('FormGroup');
    assert.strictEqual(formGroups.length, 2);

    assert.strictEqual(formGroups.at(0).find('Label').children().text(), 'Your name:');
    assert.strictEqual(formGroups.at(1).find('Label').children().text(), 'Comments:');

    formGroups.forEach((form) => {
      assert.strictEqual(form.find('Label').length, 1);
      assert.strictEqual(form.find('Input').length, 1);
    });

    const buttons = wrapper.find('Button');
    assert.strictEqual(buttons.length, 1);
    assert.strictEqual(buttons.at(0).children().text(), 'Submit');
  });

  it('should change state when typing into the forms', () => {
    const wrapper = mount(<FeedbackForm />);
    const formGroups = wrapper.find('FormGroup');
    const changedText = 'foo';
    formGroups.forEach((form, i) => {
      form.find('Input').simulate('change', {
        target: {
          value: changedText
        }
      });
      assert.strictEqual(wrapper.find('FormGroup').at(i).find('Input').prop('value'), changedText);
    });
  });
});
