module Triangulator
  class TriangleCounter
    def initialize(machine_readable_input)
      @machine_readable_input = machine_readable_input

      @final_count = 0
      @triangle_hash = Hash.new
      @triangle_hash_counter = 0
      @valid_triangle_counter = 0
      @vertical_triangle_counter = 0
      @valid_vertical_triangle_counter = 0

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
      puts "Triangle hash contains #{@triangle_hash.length} numbers"

      # puts "This is what column_1 looks like:"
      # puts ""
      # print @column_1

      @column_1.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_1.slice!(0..2)

        # puts "This is x: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end

      @column_1.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_1.slice!(0..2)

        # puts "This is x: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end
      @column_1.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_1.slice!(0..2)

        # puts "This is x: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end
      @column_1.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_1.slice!(0..2)

        # puts "This is x: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end
      @column_1.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_1.slice!(0..2)

        # puts "This is x: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end


      @column_2.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_2.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end

      @column_2.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_2.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end

      @column_2.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_2.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end

      @column_2.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_2.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end

      @column_2.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_2.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end


      @column_3.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_3.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end

      @column_3.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_3.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end

      @column_3.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_3.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end

      @column_3.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_3.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end

      @column_3.each do

        @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
        new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]

        first_three_elements = @column_3.slice!(0..2)

        # puts "This is y: #{first_three_elements}"

        first_three_elements.each do |element|
          new_entry.push(element)
        end

        @vertical_triangle_counter += 1

      end



      # puts "This is the vertical triangle hash"
      # puts ""
      # print @vertical_triangle_hash
      puts ""
      puts "\nThis the number of untested triangles are in the hash: #{@vertical_triangle_hash.length}"

      puts "\n\nThis is what column_1 looks like now:"
      puts ""
      print @column_1

      puts "\n\nThis is what column_2 looks like now:"
      puts ""
      print @column_2

      puts "\n\nThis is what column_3 looks like now:"
      puts ""
      print @column_3


      # Testing for validity
      @vertical_triangle_hash.each do |key, side|

        side_a = side[0]
        side_b = side[1]
        side_c = side[2]

        if side_a + side_b > side_c && side_b + side_c > side_a && side_a + side_c > side_b
          # puts "Valid triangle!"
          @valid_vertical_triangle_counter += 1
        else
          # puts "Invalid triangle!"
        end
      end

      total_valid_vertical_triangles = @valid_vertical_triangle_counter

      puts "This is the total number of valid vertical triangles: #{total_valid_vertical_triangles}"

    end
  end
end


# @column_1.each do |x|
#   y = x+1
#   z = y+1
#
#   if @column_1.include?(y) && @column_1.include?(z)
#
#     @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
#     new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]
#     new_entry.push(x)
#     new_entry.push(y)
#     new_entry.push(z)
#
#     @vertical_triangle_counter += 1
#
#     @column_1.delete(x)
#     @column_1.delete(y)
#     @column_1.delete(z)
#
#   end
# end
#
# @column_2.each do |x|
#   y = x+1
#   z = y+1
#
#   if @column_2.include?(y) && @column_2.include?(z)
#
#     @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
#     new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]
#     new_entry.push(x)
#     new_entry.push(y)
#     new_entry.push(z)
#
#     @vertical_triangle_counter += 1
#
#     @column_2.delete(x)
#     @column_2.delete(y)
#     @column_2.delete(z)
#   end
# end
#
# @column_3.each do |x|
#   y = x+1
#   z = y+1
#
#   if @column_3.include?(y) && @column_3.include?(z)
#
#     @vertical_triangle_hash["#{@vertical_triangle_counter}"] = Array.new
#     new_entry = @vertical_triangle_hash["#{@vertical_triangle_counter}"]
#     new_entry.push(x)
#     new_entry.push(y)
#     new_entry.push(z)
#
#     @vertical_triangle_counter += 1
#
#     @column_3.delete(x)
#     @column_3.delete(y)
#     @column_3.delete(z)
#
#   end
# end
