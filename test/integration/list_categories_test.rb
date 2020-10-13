require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'Sports')
    @category2 = Category.create(name: 'Travel')
  end

  test 'should show categories listing' do
    get categories_url
    assert_select 'a[href=?]', category_path(@category), text: 'show'
    assert_select 'a[href=?]', category_path(@category2), text: 'show'
  end
end
