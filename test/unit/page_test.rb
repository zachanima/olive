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

  test "should save page with non-empty title" do
    page = Page.new
    page.title = 'foo'
    assert page.save
  end
end
