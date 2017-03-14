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



          # case element
          # when "U"
          #   puts "MOVE UP"
          # when "D"
          #   puts "MOVE DOWN"
          # when "L"
          #   puts "MOVE LEFT"
          # when "R"
          #   puts "MOVE RIGHT"
          # when "\n"
          #   puts "REPORT"
          # end

      # puts "#{raw_input.to_str}"
      # end

      # raw_input.to_s.each do |line|
      #   if line.include?("\n")
      #     # puts "This line has a line break!"
      #     # puts "This line is this many characters: #{line.length}"
      #     puts "This is the last character of the line: #{line[-2]}"
      #     line_counter += 1
      #     instruction_counter["line_no_#{line_counter}"] = line.length
      #   end
      # end


      # puts "This is the raw input: #{analyse_input}"


    #
    #
    #
    #
    #
    #
    #
    #
    #
    #
    #   preconverted_split_raw_input = Array.new
    #   converted_split_raw_input = Array.new
    #   converted_keypad_directions = ["PLACE 0,0,NORTH"]
    #
    #   split_raw_input = raw_input.split(%r{,\s*})
    #   split_raw_input.push(",")
    #
    #   split_raw_input.each do |item|
    #     if item.start_with?("R", "L")
    #       preconverted_split_raw_input.push(item[0])
    #       preconverted_split_raw_input.push(item[1..-1])
    #     end
    #   end
    #
    #   preconverted_split_raw_input.each do |element|
    #     if element.to_i == 0
    #       converted_split_raw_input.push(element)
    #     else
    #       converted_split_raw_input.push(element.to_i)
    #     end
    #   end
    #
    #   puts "This is the converted raw input"
    #   print converted_split_raw_input
    #   puts ""
    #
    #   converted_split_raw_input.each do |element|
    #
    #     if element.class == String && directions.include?(element)
    #       case element
    #       when "R"
    #         converted_keypad_directions.push("RIGHT")
    #       when "L"
    #         converted_keypad_directions.push("LEFT")
    #       end
    #     elsif element.class == Integer
    #       puts "This is the element: #{element}"
    #       temp_array = Array.new(element) {"MOVE"}
    #       temp_array.each do |move_string|
    #         converted_keypad_directions.push(move_string)
    #         converted_keypad_directions.push("REPORT")
    #       end
    #       # converted_keypad_directions.push("REPORT")
    #     end
    #   end
    #
    #   output_file = File.absolute_path("converted_keypad_directions.txt")
    #
    #   f = open(output_file, "w")
    #
    #   converted_keypad_directions.each do |command|
    #     f.write(command + "\n")
    #   end
#     #
#     end
#   end
# end

testing_file = (File.absolute_path("spec/fixtures/commands_test_raw.txt"))

testing = KeypadNavigation::InputConverter.new(testing_file)
testing.convert_directions
