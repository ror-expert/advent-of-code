require "bundler/setup"
require "keypad_navigation"
require "keypad_navigation/keypad_grid"
require "keypad_navigation/explorer"
require "keypad_navigation/simulator"
require "keypad_navigation/command"
require "keypad_navigation/cli"
# require "keypad_navigation/input_converter"
require "keypad_navigation"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
