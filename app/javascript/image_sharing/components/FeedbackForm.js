import React, { useState } from 'react';
import { Button, FormGroup, Label, Input } from 'reactstrap';

function FeedbackForm() {
  const [name, setName] = useState('');
  const [comments, setComments] = useState('');

  return (
    <div style={{ width: '100%' }}>
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
      >Submit
      </Button>
    </div>
  );
}

export default FeedbackForm;

