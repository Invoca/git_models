# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
begin
Rails.application.initialize!
rescue => ex
  puts ex.backtrace.join("\n")
end
