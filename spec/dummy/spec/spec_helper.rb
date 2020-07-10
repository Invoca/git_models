# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require "bundler/setup"

require 'coveralls'
Coveralls.wear!('rails') if ENV['CI'] == 'true'
require_relative '../config/environment'
require 'git/git_test_helpers'
require 'git_models/test_helpers'
require 'database_cleaner'
require 'rake'
require 'rspec/rails'
require 'rspec_junit_formatter'
require 'climate_control'

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

  config.add_formatter RspecJunitFormatter, ENV['JUNIT_OUTPUT'] || 'spec/reports/rspec.xml'

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = "spec/reports/.rspec_status"

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def with_modified_env(options, &block)
    ClimateControl.modify(options, &block)
  end
end
