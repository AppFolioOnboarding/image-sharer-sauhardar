require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new page' do
    get new_image_path
    assert_response :success

    assert_select 'h3', text: 'Submit a new image!'
    assert_select 'form' do
      assert_select 'div input', 1
      assert_select 'input' do
        assert_select '[type=?]', 'submit'
      end
    end
  end

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
  test 'show images and submission link on index page' do
    Image.create(link: 'https://www.appfolio.com/images/html/apm-fb-logo.png')
    Image.create(link: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=640:*')
    Image.create(link: 'https://cf.ltkcdn.net/dogs/images/orig/235430-2000x1332-australian-shepherd-puppy.jpg')

    get images_path
    assert_response :success

    assert_select 'h3', text: 'All uploaded images:'
    assert_select 'a' do
      assert_select '[href=?]', '/images/new'
    end

    assert_select 'div img', 3
    assert_select 'div img' do
      assert_select '[width=?]', '400'
    end
  end
end
