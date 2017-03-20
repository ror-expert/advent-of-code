module Triangulator
  class InputConverter

    def initialize(raw_input)
      @raw_input = raw_input
    end

    def convert_measurements

      raw_input = @raw_input
      machine_readable = Hash.new
      triangle_counter = 0

      output_file = File.absolute_path("converted_triangle_measurements.txt")
      f = open(output_file, "w")
      puts "This is what the raw input looks like at the moment: \n#{raw_input}"

      split_raw_input = raw_input.split("\n")
      puts "This is what the split raw_input looks like: \n #{split_raw_input}"

      split_raw_input.each do |element|
        stripped_element = element.split(%r{ \s*})
        puts "This is the stripped element: #{stripped_element}"
        machine_readable["T#{triangle_counter}"] = stripped_element
        triangle_counter += 1
      end

      puts "This is machine readable:"
      puts machine_readable
      puts "This is the hash length: #{machine_readable.length}"

      machine_readable.each do |key, array|

        side_a = array[0].to_i
        side_b = array[1].to_i
        side_c = array[2].to_i

        if side_a + side_b > side_c
          puts "Valid triangle: side_a (#{side_a}) + side_b (#{side_b}) > side_c #{side_c}"
        elsif side_b + side_c > side_a
          puts "Valid triangle: b + c > a"
        elsif side_a + side_c > side_b
          puts "Valid triangle: a + c > b"
        else
          puts "Invalid triangle!"
        end
      end
    end
  end
end








# split_raw_input.each do |element|
#   split_element = element.to_s.split(%r{ \s*})
#   puts "This is the split element: #{split_element}"
# end



# split_raw_input.each do |line|
#   machine_readable.push(line)
#   #   end
# end
#
#
# if line.match("\n")
#   puts "Linebreak!"
#   split_line = line.to_s.split("\n")
#   split_line.to_a.each do |element|
#     puts "This is the element: #{element}"

# module CityNavigation
#   class InputConverter
#
#     def initialize(raw_input)
#       @raw_input = raw_input
#     end
#
#     def convert_directions
#
#       raw_input = @raw_input
#       directions = ["R", "L"]
#
#       preconverted_split_raw_input = Array.new
#       converted_split_raw_input = Array.new
#       converted_city_directions = ["PLACE 0,0,NORTH"]
#
#       split_raw_input = raw_input.split(%r{,\s*})
#       split_raw_input.push(",")
#
#       split_raw_input.each do |item|
#         if item.start_with?("R", "L")
#           preconverted_split_raw_input.push(item[0])
#           preconverted_split_raw_input.push(item[1..-1])
#         end
#       end
#
#       preconverted_split_raw_input.each do |element|
#         if element.to_i == 0
#           converted_split_raw_input.push(element)
#         else
#           converted_split_raw_input.push(element.to_i)
#         end
#       end
#
#       puts "This is the converted raw input"
#       print converted_split_raw_input
#       puts ""
#
#       directions = ["R", "L"]
#
#       converted_split_raw_input.each do |element|
#
#         if element.class == String && directions.include?(element)
#           case element
#           when "R"
#             converted_city_directions.push("RIGHT")
#           when "L"
#             converted_city_directions.push("LEFT")
#           end
#         elsif element.class == Integer
#           puts "This is the element: #{element}"
#           temp_array = Array.new(element) {"MOVE"}
#           temp_array.each do |move_string|
#             converted_city_directions.push(move_string)
#             converted_city_directions.push("REPORT")
#           end
#           # converted_city_directions.push("REPORT")
#         end
#       end
#
#       output_file = File.absolute_path("converted_city_directions.txt")
#
#       f = open(output_file, "w")
#
#       converted_city_directions.each do |command|
#         f.write(command + "\n")
#       end
#
#     end
#   end
# end
#
# testing_file = File.read(File.absolute_path("spec/fixtures/commands.txt"))
#
# testing = CityNavigation::InputConverter.new(testing_file)
# testing.convert_directions
