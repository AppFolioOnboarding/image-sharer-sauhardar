require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get images_path
    assert_response :success
  end

  test 'create an image' do
    assert_difference 'Image.count' do
      post images_path, params: { image: { link: 'https://www.appfolio.com/images/html/apm-fb-logo.png' } }
      assert_redirected_to image_path(Image.last)
    end
  end
end
