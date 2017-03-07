module CityNavigation
  class InputConverter

    def initialize(raw_input)
      @raw_input = raw_input
    end

    def convert_directions

      raw_input = @raw_input

      converted_split_raw_input = Array.new
      converted_city_directions = ["PLACE 0,0,NORTH"]

      # split_raw_input = raw_input.split(/\s*\s*/)
      split_raw_input = raw_input.split(",")
      split_raw_input.push(",")

      split_raw_input.each do |element|
        if element.to_i == 0
          converted_split_raw_input.push(element)
        else
          converted_split_raw_input.push(element.to_i)
        end
      end

      puts "This is the converted raw input"
      print converted_split_raw_input
      puts ""

      converted_split_raw_input.each do |element|
        if element.include?("R")
          # puts "This is a right turn"
          converted_city_directions.push("RIGHT")
        elsif element.include?("L")
          # puts "This is a left turn"
          converted_city_directions.push("LEFT")
        elsif element.class == Integer
          # puts "This is the element: #{element}"
          temp_array = Array.new(element) {"MOVE"}
          temp_array.each do |move_string|
            converted_city_directions.push(move_string)
          end
        elsif element == ","
          converted_city_directions.push("REPORT")
        else
        end
      end

      puts "here are the converted_city_directions"
      print converted_city_directions
      puts ""


      output_file = File.absolute_path("converted_city_directions.txt")

      f = open(output_file, "w")

      converted_city_directions.each do |command|
        f.write(command + "\n")
      end

    end
  end
end

testing_file = File.read(File.absolute_path("spec/fixtures/commands.txt"))

testing = CityNavigation::InputConverter.new(testing_file)
testing.convert_directions
