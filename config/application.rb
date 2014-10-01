require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kraidcomp
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    config.encoding = 'utf-8'
    config.time_zone = 'Pacific Time (US & Canada)'
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    # Sass settings
    config.sass.preferred_syntax = :sass
  end
end
