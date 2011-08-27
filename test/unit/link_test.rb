require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "should not save without title" do
    link = Factory.build(:link, title: nil)
    assert !link.save
  end

  test "should save" do
    link = Factory.build(:link)
    assert link.save
  end

  test "should set position to 0" do
    link = Factory(:link)
    assert_equal link.position, 0
  end

  test "should increment position by 1" do
    3.times { Factory(:link) }
    link = Factory(:link)
    assert_equal link.position, Link.all[-2].position + 1
  end

  test "should not set position" do
    link = Factory(:link, title: 'foo')
    assert_no_difference('link.position') do
      link.update_attributes(title: 'bar')
    end
  end

  test "should order by position" do
    Factory(:link, position: 1)
    Factory(:link, position: 0)
    assert_equal Link.scoped, Link.order(:position)
  end
end
