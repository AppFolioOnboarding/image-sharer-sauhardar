import React, { useState } from 'react';
import { Button, FormGroup, Label, Input, Alert } from 'reactstrap';
import { post } from '../utils/helper';

function FeedbackForm() {
  const [name, setName] = useState('');
  const [comments, setComments] = useState('');
  const [isBannerVisible, setIsBannerVisible] = useState(false);
  const [bannerMsg, setBannerMsg] = useState('');
  const [serverError, setServerError] = useState(false);

  const submitFeedback = () => {
    post('/api/feedbacks', {
      feedback: {
        name,
        comments,
      }
    })
      .then((res) => {
        if (res.status === 'success') {
          setServerError(false);
          setBannerMsg(`Success! Thank you for submitting your feedback, ${name}.`);
        } else {
          throw new Error('Unexpected error.');
        }
      })
      .catch(() => {
        setServerError(true);
        setBannerMsg('Error! Please try again.');
      });
    setIsBannerVisible(true);
    setComments('');
    setName('');
    setTimeout(() => setIsBannerVisible(false), 5000);
  };

  return (
    <div style={{ width: '100%' }}>
      <Alert
        color={serverError ? 'danger' : 'success'}
        fade
        isOpen={isBannerVisible}
      >{bannerMsg}
      </Alert>
      <FormGroup>
        <Label>Your name:</Label>
        <Input name="name" onChange={e => setName(e.target.value)} value={name} />
      </FormGroup>
      <FormGroup>
        <Label>Comments:</Label>
        <Input
          type="textarea"
          name="comments"
          onChange={e => setComments(e.target.value)}
          value={comments}
        />
      </FormGroup>
      <Button
        color="primary"
        onClick={submitFeedback}
      >Submit
      </Button>
    </div>
  );
}

export default FeedbackForm;

