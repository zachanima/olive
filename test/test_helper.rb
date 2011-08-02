require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def assert_fields attributes
    attributes.each do |attribute|
      assert_select "[name$='[#{attribute}]']"
    end
    assert_select "input[type=submit]"
  end
end
