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

      split_raw_input = raw_input.split("\n")
      # puts "This is the split raw_input"
      # puts split_raw_input

      split_raw_input.each do |element|
        final_output = ""
        stripped_element = element.split(%r{ \s*})
        f.write("#{stripped_element[0]},#{stripped_element[1]},#{stripped_element[2]}")
        f.write("\n")
      end

      f.close()

      final_output = File.read("converted_triangle_measurements.txt")




    end
  end
end
