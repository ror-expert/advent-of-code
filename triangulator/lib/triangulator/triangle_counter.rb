module Triangulator
  class TriangleCounter
    def initialize(machine_readable_input)
      @machine_readable_input = machine_readable_input

      @final_count = 0
      @triangle_hash = Hash.new
      @triangle_hash_counter = 0
      @valid_triangle_counter = 0
      @vertical_triangle_counter = 0

      @column_1 = Array.new
      @column_2 = Array.new
      @column_3 = Array.new

      @vertical_triangle_hash = Hash.new

    end

    def count_valid_triangles

      # triangle_hash = @triangle_hash

      import_input = File.read(@machine_readable_input)
      # puts "This is the imported input: #{import_input}"


      input_as_array = import_input.split("\n")

      input_as_array.each do |element|

        split_elements = element.split(",")

        split_elements_to_i = Array.new
        split_elements_to_i.push(split_elements[0].to_i)
        split_elements_to_i.push(split_elements[1].to_i)
        split_elements_to_i.push(split_elements[2].to_i)

        @triangle_hash["T#{@triangle_hash_counter}"] = split_elements_to_i
        @triangle_hash_counter += 1

      end

      @triangle_hash.each do |key, side|

        side_a = side[0]
        side_b = side[1]
        side_c = side[2]

        if side_a + side_b > side_c && side_b + side_c > side_a && side_a + side_c > side_b
          # puts "Valid triangle!"
          @valid_triangle_counter += 1
        else
          # puts "Invalid triangle!"
        end
      end

      @final_count = @valid_triangle_counter
      puts "This is the number of valid triangles: #{@final_count}"
      return @final_count

    end

    def vertical_triangle_counter

      @triangle_hash.each do |key, side|

        side_a = side[0]
        side_b = side[1]
        side_c = side[2]

        @column_1.push(side_a)
        @column_2.push(side_b)
        @column_3.push(side_c)

      end

      puts "Column 1 contains #{@column_1.length} numbers"
      puts "Column 2 contains #{@column_2.length} numbers"
      puts "Column 3 contains #{@column_3.length} numbers"

      puts ""
      # puts "This is column_2"
      # print @column_2.sort
      # puts ""
      # puts "This is column_3"
      # print @column_3.sort
      # puts ""

      @column_1.each do |x|
        y = x+1
        z = y+1

        if @column_1.include?(y) && @column_1.include?(z)

          @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
          new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]
          new_entry.push(x)
          new_entry.push(y)
          new_entry.push(z)

          @vertical_triangle_counter += 1

          @column_1.delete(x)
          @column_1.delete(y)
          @column_1.delete(z)

        elsif @column_2.include?(y) && @column_2.include?(z)

          @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
          new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]
          new_entry.push(x)
          new_entry.push(y)
          new_entry.push(z)

          @vertical_triangle_counter += 1

          @column_2.delete(x)
          @column_2.delete(y)
          @column_2.delete(z)
        elsif @column_3.include?(y) && @column_3.include?(z)

          @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
          new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]
          new_entry.push(x)
          new_entry.push(y)
          new_entry.push(z)

          @vertical_triangle_counter += 1

          @column_3.delete(x)
          @column_3.delete(y)
          @column_3.delete(z)

        end
      end

      puts "This are the 'vertical' triangles #{@vertical_triangle_hash}"

      puts "This is the number of 'vertical' triangles #{@vertical_triangle_hash.length}"


      puts "Column 1 now contains #{@column_1.length} numbers"
      puts "Column 2 now contains #{@column_2.length} numbers"
      puts "Column 3 now contains #{@column_3.length} numbers"

    end
  end
end
