module Triangulator
  class TriangleCounter
    def initialize(machine_readable_input)
      @machine_readable_input = machine_readable_input
    end

    def count_valid_triangles

      import_input = File.read(@machine_readable_input)
      # puts "This is the imported input: #{import_input}"

      triangle_hash = Hash.new
      triangle_hash_counter = 0
      valid_triangle_counter = 0

      input_as_array = import_input.split("\n")

      input_as_array.each do |element|

        split_elements = element.split(",")

        split_elements_to_i = Array.new
        split_elements_to_i.push(split_elements[0].to_i)
        split_elements_to_i.push(split_elements[1].to_i)
        split_elements_to_i.push(split_elements[2].to_i)

        triangle_hash["T#{triangle_hash_counter}"] = split_elements_to_i
        triangle_hash_counter += 1

      end

      triangle_hash.each do |key, side|

        side_a = side[0]
        side_b = side[1]
        side_c = side[2]

        if side_a + side_b > side_c && side_b + side_c > side_a && side_a + side_c > side_b
          # puts "Valid triangle!"
          valid_triangle_counter += 1
        else
          # puts "Invalid triangle!"
        end
      end

      final_count = valid_triangle_counter
      puts "This is the number of valid triangles: #{final_count}"
      return final_count

    end
  end
end
