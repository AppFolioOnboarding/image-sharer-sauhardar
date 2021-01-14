require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'create an image' do
    assert_difference 'Image.count' do
      post images_path, params: { image: { link: 'https://www.appfolio.com/images/html/apm-fb-logo.png' } }
      assert_redirected_to image_path(Image.last)
    end
  end

  test 'should show an image' do
    created_image = Image.create(link: 'https://www.appfolio.com/images/html/apm-fb-logo.png')
    get image_path(created_image.id)
    assert_response :success

    assert_select 'img' do
      assert_select '[src=?]', 'https://www.appfolio.com/images/html/apm-fb-logo.png'
    end
  end
end
