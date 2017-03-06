module CityNavigation
  class Simulator
    attr_reader :explorer

    def initialize(city_grid)
      @city_grid = city_grid
    end

    def place(east, north, facing)
      return unless @city_grid.valid_location?(east, north)
      @explorer = Explorer.new(east, north, facing)
    end

    def explorer_placed?
      !explorer.nil?
    end

    def move
      return unless explorer_placed?
      return unless @city_grid.valid_location?(*explorer.next_move)
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
      return unless explorer_placed?
      position = explorer.report
      puts "Explorer is currently at (#{position[:east]}, #{position[:north]}) and is facing #{position[:direction]}"
    end

    def invalid(command)
      puts "'#{command.strip}' is an invalid command"

    end

  end
end
