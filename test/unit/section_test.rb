require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  test "should not save without page" do
    section = Section.new(text: 'foo')
    assert !section.save
  end

  test "should not save without text" do
    section = Page.first.sections.build
    assert !section.save
  end

  test "should not save with empty text" do
    section = Page.first.sections.build(text: '')
    assert !section.save
  end

  test "should not save with non-existent page" do
    section = Page.first.sections.build
    Page.first.destroy
    assert !section.save
  end

  test "should save with page and text" do
    section = Page.first.sections.build(text: 'foo')
    assert section.save
  end
end
