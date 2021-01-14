require 'test_helper'

class ApplicationTest < ActionDispatch::IntegrationTest
  test 'display home page' do
    get root_path
    assert_response :success
    assert_select 'div h1', text: 'hello from application#home'
  end
end
