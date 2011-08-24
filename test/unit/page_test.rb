require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "should not save without title" do
    page = Factory.build(:page, title: nil)
    assert !page.save
  end

  test "should not save with empty title" do
    page = Factory.build(:page, title: '')
    assert !page.save
  end

  test "should save" do
    page = Factory.build(:page)
    assert page.save
  end

  test "should set position to 0" do
    page = Factory(:page)
    assert_equal page.position, 0
  end

  test "should increment position by 1" do
    3.times { Factory(:page) }
    page = Factory(:page)
    assert_equal page.position, Page.all[-2].position + 1
  end

  test "should not set position" do
    page = Factory(:page, title: 'foo')
    assert_no_difference('page.position') do
      page.update_attributes(title: 'bar')
    end
  end

  test "should order by position" do
    Factory(:page, position: 1)
    Factory(:page, position: 0)
    assert_equal Page.scoped, Page.order(:position)
  end
end
