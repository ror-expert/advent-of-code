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

    def turn_north
      return unless explorer_placed?
      explorer.turn_north
    end

    def turn_south
      return unless explorer_placed?
      explorer.turn_south
    end

    def turn_east
      return unless explorer_placed?
      explorer.turn_east
    end

    def turn_west
      return unless explorer_placed?
      explorer.turn_west
    end

    def move_up
      return unless explorer_placed?
      return unless @keypad_grid.valid_location?(*explorer.next_move)
      explorer.move_up
    end

    def move_down
      return unless explorer_placed?
      return unless @keypad_grid.valid_location?(*explorer.next_move)
      explorer.move_down
    end

    def move_left
      return unless explorer_placed?
      return unless @keypad_grid.valid_location?(*explorer.next_move)
      explorer.move_left
    end

    def move_right
      return unless explorer_placed?
      return unless @keypad_grid.valid_location?(*explorer.next_move)
      explorer.move_right
    end

    def report

      return unless explorer_placed?
      position = explorer.report

      puts "Explorer is currently at (#{position[:east]}, #{position[:north]}) and is facing #{position[:direction]}"

      current_location = [position[:east], position[:north]]

          @locations_visited.push(current_location)

    end

    def keypad_report
      return unless explorer_placed?
      keypad_position = explorer.keypad_report

      puts "Explorer is currently on key number: #{keypad_position[:keypad]}"
      end

    end

    def invalid(command)
      puts "'#{command.strip}' is an invalid command"

    end

  end
end
