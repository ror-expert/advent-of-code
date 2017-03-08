require_relative "keypad_grid"
require_relative "cli"
require_relative "command"
require_relative "explorer"
require_relative "input_converter"
require_relative "simulator"
require_relative "version"

raw_input = File.read(File.absolute_path("spec/fixtures/commands.txt"))

input_converter = KeypadNavigation::InputConverter.new(raw_input)
input_converter.convert_directions

converted_keypad_directions = File.read(File.absolute_path("spec/fixtures/converted_keypad_directions.txt"))



cli = KeypadNavigation::CLI.new
# cli.load_commands(converted_keypad_directions)
cli.run(converted_keypad_directions)
