require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should successfully send a POST request to submit feedback' do
    name = 'John Smith'
    comments = 'Great product, very nice.'
    res = post '/api/feedbacks', params: { feedback: {
      name: name, comments: comments
    } }

    assert_equal res, 200
    assert_response :success

    assert_equal response.body[name], name
    assert_equal response.body[comments], comments
  end

  test 'should return an error with incorrectly formatted POST body' do
    name = 'John Smith'
    comments = 'Great product, very nice.'
    post '/api/feedbacks', params: { name: name, comments: comments }

    assert_response 500
  end
end
