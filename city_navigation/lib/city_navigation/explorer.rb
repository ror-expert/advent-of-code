module CityNavigation

  class Explorer
    DIRECTIONS = %w[NORTH, EAST, SOUTH, WEST]
    attr_reader :east, :north, :direction

    def initialize(east = 0, north = 0, direction = "NORTH")
      @east = east
      @north = north
      @direction = direction
    end

    def move_east
      @east += 1
    end



  end

end
