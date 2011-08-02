require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "should not save page without title" do
    page = Page.new
    assert !page.save, "Saved page without title"
  end
end
