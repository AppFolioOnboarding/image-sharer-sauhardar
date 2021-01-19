import React from 'react';
import { Col, Container, Row } from 'reactstrap';
import Header from './Header';
import FeedbackForm from './FeedbackForm';
import Footer from './Footer';

export default function App() {
  return (
    <Container>
      <Row >
        <Col md={{ span: 4, offset: 4 }} >
          <Header title="Tell us what you think" />
        </Col>
      </Row>
      <Row>
        <FeedbackForm />
      </Row>
      <Row>
        <Col md={{ span: 3, offset: 5 }}>
          <Footer text="Copyright: AppFolio Inc. Onboarding" />
        </Col>
      </Row>
    </Container>

  );
}

/* TODO: Add Prop Types check*/
