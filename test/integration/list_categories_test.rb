require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'Sports')
    @category2 = Category.create(name: 'Travel')
  end

  test 'should show categories listing' do
    get categories_url
    assert_select 'a[href=?]', category_path(@category), h4: @category.name
    assert_select 'a[href=?]', category_path(@category2), h4: @category2.name
  end
end
