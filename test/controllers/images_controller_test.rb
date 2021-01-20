require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new page' do
    get new_image_path
    assert_response :success

    assert_select 'h3', text: 'Submit a new image!'
    assert_select 'form' do
      assert_select 'div input', 2
      assert_select 'input' do
        assert_select '[type=?]', 'submit'
      end
    end
  end

  test 'create an image without tags' do
    assert_difference 'Image.count' do
      post images_path, params: {
        image: {
          link: 'https://www.appfolio.com/images/html/apm-fb-logo.png',
          tag_list: ''
        }
      }
      assert_redirected_to image_path(Image.last)
    end
  end

  test 'create an image with tags' do
    assert_difference 'Image.count' do
      post images_path, params: {
        image: {
          link: 'https://www.appfolio.com/images/html/apm-fb-logo.png',
          tag_list: 'tag1, tag2'
        }
      }
      assert_redirected_to image_path(Image.last)
    end
    img_tags = Image.last.tag_list
    assert_equal img_tags.length, 2
  end

  test 'should show an image without tags' do
    created_image = Image.create(link: 'https://www.appfolio.com/images/html/apm-fb-logo.png')
    get image_path(created_image.id)
    assert_response :success

    assert_select 'img' do
      assert_select '[src=?]', 'https://www.appfolio.com/images/html/apm-fb-logo.png'
      assert_select '[width=?]', '400'
    end
    p_tag = css_select('p')
    assert_equal p_tag.text.strip, 'Tags:'
  end

  test 'should show an image with tags' do
    created_image = Image.create(link: 'https://www.appfolio.com/images/html/apm-fb-logo.png',
                                 tag_list: %w[tag1 tag2])
    get image_path(created_image.id)
    assert_response :success

    assert_select 'img' do
      assert_select '[src=?]', 'https://www.appfolio.com/images/html/apm-fb-logo.png'
      assert_select '[width=?]', '400'
    end
    p_tag = css_select('p')
    assert_equal p_tag.text.delete(' ').delete("\n"), 'Tags:tag1,tag2'
  end

  test 'show images and submission link on index page' do
    Image.create(link: 'https://www.appfolio.com/images/html/apm-fb-logo.png')
    Image.create(link: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=640:*')
    Image.create(link: 'https://cf.ltkcdn.net/dogs/images/orig/235430-2000x1332-australian-shepherd-puppy.jpg')
    Image.create(link: 'https://cf.ltkcdn.net/dogs/images/orig/235430-2000x1332-australian-shepherd-puppy.jpg',
                 tag_list: %w[tag1 tag2])

    get images_path
    assert_response :success

    assert_select 'h3', text: 'All uploaded images:'
    assert_select 'a' do
      assert_select '[href=?]', '/images/new'
    end

    assert_select 'div img', 4
    assert_select 'div' do
      assert_select 'img' do
        assert_select '[width=?]', '400'
      end
      assert_select 'form' do
        assert_select '[class=?]', 'button_to'
        assert_select '[method=?]', 'post'
        assert_select 'input' do
          assert_select '[type=?]', 'submit'
          assert_select '[value=?]', 'Delete'
        end
      end
    end

    expected_tag_text = [
      'Tags:tag1tag2',
      'Tags:',
      'Tags:',
      'Tags:'
    ]

    p_tags_arr = css_select('p')
    assert_equal p_tags_arr.map { |p_tag| p_tag.text.delete(' ').delete("\n") }, expected_tag_text
  end

  test 'All tags are shown and clickable' do
    Image.create(link: 'https://www.appfolio.com/images/html/apm-fb-logo.png')
    Image.create(link: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=640:*')
    Image.create(link: 'https://cf.ltkcdn.net/dogs/images/orig/235430-2000x1332-australian-shepherd-puppy.jpg')
    Image.create(link: 'https://cf.ltkcdn.net/dogs/images/orig/235430-2000x1332-australian-shepherd-puppy.jpg',
                 tag_list: %w[tag1 tag2 tag10])

    get images_path
    assert_response :success

    assert_select 'div.tags-container a', 4

    expected_tag_text = %w[
      allimages
      tag1
      tag2
      tag10
    ]

    a_tags_arr = css_select('div.tags-container>a')
    assert_equal a_tags_arr.map { |a_tag| a_tag.text.delete(' ').delete("\n") }, expected_tag_text
  end

  test 'Tag with a space' do
    Image.create(link: 'https://www.appfolio.com/images/html/apm-fb-logo.png', tag_list: ['San Diego'])

    get images_path
    assert_response :success

    assert_select 'a' do |elements|
      assert_equal '/images?tag=San+Diego', elements[2].attr('href')
      assert_equal '/images?tag=San+Diego', elements[3].attr('href')
    end
  end

  test 'All images on the page have the correct tag' do
    Image.create(link: 'https://www.appfolio.com/images/html/1apm-fb-logo.png', tag_list: %w[tag1 randomTag])
    Image.create(link: 'https://www.appfolio.com/images/html/2apm-fb-logo.png', tag_list: %w[abcd])
    Image.create(link: 'https://www.appfolio.com/images/html/3apm-fb-logo.png', tag_list: %w[efgh tag2 tag1])
    Image.create(link: 'https://www.appfolio.com/images/html/4apm-fb-logo.png', tag_list: %w[tag1 tag2 tag10])

    get images_path, params: { tag: 'tag1' }
    assert_response :success

    assert_select '[src=?]', 'https://www.appfolio.com/images/html/1apm-fb-logo.png', count: 1
    assert_select '[src=?]', 'https://www.appfolio.com/images/html/3apm-fb-logo.png', count: 1
    assert_select '[src=?]', 'https://www.appfolio.com/images/html/4apm-fb-logo.png', count: 1
  end

  test 'No images shown when there are no images with the given tag' do
    get images_path, params: { tag: 'tag1' }
    assert_response :success

    assert_select 'img', count: 0
    assert_select 'p', text: 'No images tagged with tag1!'
  end

  test 'Delete image' do
    img_to_delete = Image.create(link: 'https://www.appfolio.com/images/html/4apm-fb-logo.png',
                                 tag_list: %w[tag1 tag2 tag10])

    assert_difference 'Image.count', -1 do
      delete image_path(img_to_delete.id)
      assert_redirected_to images_path
    end
  end
end
