require "bundler/setup"
require "city_navigation"
require "city_navigation/city_grid"
require "city_navigation/explorer"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
