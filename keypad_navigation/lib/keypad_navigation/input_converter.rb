module KeypadNavigation
  class InputConverter

    def initialize(raw_input)
      @raw_input = File.readlines(raw_input)
    end

    def convert_directions

      raw_input = @raw_input
      output_file = File.absolute_path("converted_keypad_directions.txt")

      directions = ["U", "D", "L", "R"]

      converted_keypad_directions = ["PLACE 0,0,NORTH"]

      line_counter = 0

      instruction_counter = Hash.new


      raw_input.each do |line|
        puts "This is line number #{line_counter}"
        puts "This is the line: #{line}"
        puts "This line has #{line.length} instructions."
        puts "This is the first instruction: #{line[0]}"
        puts "This is the last instruction: #{line[-2]}"
        line_counter += 1
        puts ""

        string_line = line.to_str
        split_string_line = string_line.split("")

        puts "This is the split: #{split_string_line}"

        split_string_line.each do |element|

          case element
          when "U"
            converted_keypad_directions.push("TURN_NORTH")
            converted_keypad_directions.push("MOVE")
            # converted_keypad_directions.push("REPORT")
          when "D"
            converted_keypad_directions.push("TURN_SOUTH")
            converted_keypad_directions.push("MOVE")
            # converted_keypad_directions.push("REPORT")
          when "L"
            converted_keypad_directions.push("TURN_WEST")
            converted_keypad_directions.push("MOVE")
            # converted_keypad_directions.push("REPORT")
          when "R"
            converted_keypad_directions.push("TURN_EAST")
            converted_keypad_directions.push("MOVE")
            # converted_keypad_directions.push("REPORT")
          when "\n"
            converted_keypad_directions.push("REPORT")
            # converted_keypad_directions.push("REPORT")
          end
        end
      end

      puts "These are the directions: #{converted_keypad_directions}"


      f = open(output_file, "w")

      converted_keypad_directions.each do |command|
        f.write(command + "\n")
      end

    end
  end
end



testing_file = (File.absolute_path("spec/fixtures/commands_test_raw.txt"))

testing = KeypadNavigation::InputConverter.new(testing_file)
testing.convert_directions
