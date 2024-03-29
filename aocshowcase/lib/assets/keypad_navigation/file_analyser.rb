input_file = File.readlines('puzzle_input.txt')

puts input_file

line_counter = 0

instruction_counter = Hash.new

input_file.each do |line|
  if line.include?("\n")
    # puts "This line has a line break!"
    # puts "This line is this many characters: #{line.length}"
    puts "This is the last character of the line: #{line[-2]}"
    line_counter += 1
    instruction_counter["line_no_#{line_counter}"] = line.length
  end
end

puts "The document contains #{line_counter} lines."
puts "These are the number of instructions per line:"
puts instruction_counter


preconverted_split_raw_input = Array.new
  converted_split_raw_input = Array.new
  converted_keypad_directions = ["PLACE 0,0,NORTH"]

  split_raw_input = raw_input.split(%r{,\s*})
  split_raw_input.push(",")

  split_raw_input.each do |item|
    if item.start_with?("R", "L")
      preconverted_split_raw_input.push(item[0])
      preconverted_split_raw_input.push(item[1..-1])
    end
  end

  preconverted_split_raw_input.each do |element|
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

    if element.class == String && directions.include?(element)
      case element
      when "R"
        converted_keypad_directions.push("RIGHT")
      when "L"
        converted_keypad_directions.push("LEFT")
      end
    elsif element.class == Integer
      puts "This is the element: #{element}"
      temp_array = Array.new(element) {"MOVE"}
      temp_array.each do |move_string|
        converted_keypad_directions.push(move_string)
        converted_keypad_directions.push("REPORT")
      end
      # converted_keypad_directions.push("REPORT")
    end
  end

  output_file = File.absolute_path("converted_keypad_directions.txt")

  f = open(output_file, "w")

  converted_keypad_directions.each do |command|
    f.write(command + "\n")
  end
