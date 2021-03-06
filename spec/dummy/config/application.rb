# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'active_model/validations/presence'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require 'git_models'

module Dummy
  class Application < Rails::Application
    if Rails::VERSION::MAJOR >= 5
      # Initialize configuration defaults for originally generated Rails version.
      config.load_defaults "#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
