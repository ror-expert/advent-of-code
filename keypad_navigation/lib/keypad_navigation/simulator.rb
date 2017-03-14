module KeypadNavigation
  class Simulator


    attr_reader :explorer

    def initialize(keypad_grid)
      @keypad_grid = keypad_grid
      @locations_visited = [[0,0]]
    end

    def place(east, north, facing)
      return unless @keypad_grid.valid_location?(east, north)
      @explorer = Explorer.new(east, north, facing)
    end

    def explorer_placed?
      !explorer.nil?
    end

    def move
      return unless explorer_placed?
      return unless @keypad_grid.valid_location?(*explorer.next_move)
      explorer.move
    end

    def turn_left
      return unless explorer_placed?
      explorer.turn_left
    end

    def turn_right
      return unless explorer_placed?
      explorer.turn_right
    end

    def report

      # locations_visited = @locations_visited

      # puts "These are the locations visited: #{@locations_visited}"

      return unless explorer_placed?
      position = explorer.report

      puts "Explorer is currently at (#{position[:east]}, #{position[:north]}) and is facing #{position[:direction]}"

      current_location = [position[:east], position[:north]]

      # if @locations_visited.count(current_location) >= 1
      #   puts "You have been to this location before: #{current_location}"
      #   puts "You have been here this many times: #{@locations_visited.count(current_location)}"
      # else
      #   puts "You have NOT been here before: #{current_location}, i.e. #{@locations_visited.count(current_location)} times."
      # end

      # final_position = explorer.report
      # distance_from_start = final_position[:east].abs + final_position[:north].abs
      # puts "This address is #{distance_from_start} blocks away from the starting point"
      # puts "Here are all the places visited:"
      # print @locations_visited
      # puts ""
      # puts ""

      @locations_visited.push(current_location)

    end

    def invalid(command)
      puts "'#{command.strip}' is an invalid command"

    end

  end
end
