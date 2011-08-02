require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "not saving page without title" do
    page = Page.new
    assert !page.save
  end

  test "not saving page with empty title" do
    page = Page.new
    page.title = ''
    assert !page.save
  end

  test "saving page with non-empty title" do
    page = Page.new
    page.title = 'foo'
    assert page.save
  end
end
