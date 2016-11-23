ENV['RAILS_ENV'] ||= 'test'
require 'coveralls'
Coveralls.wear!('rails') if ENV['CI'] == 'true'
require_relative '../config/environment'
require 'rails/test_help'
require 'git/git_test_helpers'
require 'git_models/test_helpers'
require 'database_cleaner'
require 'rake'
require 'rspec/rails'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    ActiveRecord::Migration.maintain_test_schema!
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
