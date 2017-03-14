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
