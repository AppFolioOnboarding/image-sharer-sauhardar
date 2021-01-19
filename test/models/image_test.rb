require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'test taggable relationship' do
    img = Image.create!(link: 'https://cf.ltkcdn.net/dogs/images/orig/235430-2000x1332-australian-shepherd-puppy.jpg',
                        tag_list: 'tag1, tag2')
    assert_equal img.tag_list, %w[tag1 tag2]

    img.tag_list.remove('tag1')
    assert_equal img.tag_list, ['tag2']

    img.tag_list.add('tag10')
    assert_equal img.tag_list, %w[tag2 tag10]

    img.save!
    img.reload
    assert_equal img.tag_list, %w[tag2 tag10]
  end
end
