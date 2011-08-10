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

  test "should not save with empty text" do
    section = Factory.build(:section, text: '')
    assert !section.save
  end

  test "should not save with non-existent page" do
    page = Factory(:page)
    section = Factory.build(:section, page_id: page.id)
    page.destroy
    assert !section.save
  end

  test "should save with page and text" do
    section = Factory.build(:section)
    assert section.save
  end
end
