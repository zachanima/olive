require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "should not save page without title" do
    page = Page.new
    assert !page.save
  end

  test "should not save page with empty title" do
    page = Page.new
    page.title = ''
    assert !page.save
  end

  test "should save page" do
    page = pages(:one)
    assert page.save
  end

  test "should order by position" do
    assert_equal Page.scoped, Page.order(:position)
  end
end
