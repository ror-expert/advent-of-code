require "bundler/setup"
require "city_navigation"
require "city_navigation/city_grid"
require "city_navigation/explorer"
require "city_navigation/simulator"
require "city_navigation/command"
require "city_navigation/cli"
require "city_navigation/input_converter"
require "city_navigation"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
