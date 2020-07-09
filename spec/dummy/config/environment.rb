# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
begin
Rails.application.initialize!
rescue => ex
  binding.pry
  puts ex.backtrace.join("\n")
end
