require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  test "should not save without page" do
    section = Factory.build(:section, page_id: nil)
    assert !section.save
  end

  test "should not save without text" do
    section = Factory.build(:section, text: nil)
    assert !section.save
  end

  test "should not save with non-existent page" do
    page = Factory(:page)
    section = Factory.build(:section, page_id: page.id)
    page.destroy
    assert !section.save
  end

  test "should save" do
    section = Factory.build(:section)
    assert section.save
  end

  test "should set position to 0" do
    section = Factory(:section)
    assert_equal section.position, 0
  end

  test "should increment position by 1" do
    page = Factory(:page)
    3.times { Factory(:section, page_id: page.id) }
    section = Factory(:section, page_id: page.id)
    assert_equal section.position, page.sections[-2].position + 1
  end

  test "should not set position" do
    section = Factory(:section, text: 'foo')
    assert_no_difference('section.position') do
      section.update_attributes(text: 'bar')
    end
  end

  test "should order by position" do
    Factory(:section, position: 1)
    Factory(:section, position: 0)
    assert_equal Section.scoped, Section.order(:position)
  end
end
