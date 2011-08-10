require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require *Rails.groups(:assets) if defined?(Bundler)

module Olive
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    config.generators do |generator|
      generator.fixture_replacement :factory_girl, dir: 'test/factories'
    end
  end
end
