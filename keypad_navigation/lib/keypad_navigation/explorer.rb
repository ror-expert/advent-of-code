module KeypadNavigation

  class Explorer
    DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]
    attr_reader :east, :north, :direction, :keypad

    def initialize(east = 0, north = 0, direction = "NORTH")
      @east = east
      @north = north
      @direction = direction
    end

    def move_east
      @east += 1
    end

    def move_west
      @east -= 1
    end

    def move_north
      @north += 1
    end

    def move_south
      @north -= 1
    end


    def move
      send("move_#{@direction.downcase}")
    end

    def turn(turn_direction)
      index = DIRECTIONS.index(@direction)
      rotations = turn_direction == :right ? 1 : -1
      @direction = DIRECTIONS.rotate(rotations)[index]
    end

    def turn_left
      turn(:left)
    end

    def turn_right
      turn(:right)
    end

    def turn_north
      case @direction
      when "EAST"
        turn(:left)
      when "SOUTH"
        turn(:left)
        turn(:left)
      when "WEST"
        turn(:right)
      end
    end

    def turn_east
      case @direction
      when "SOUTH"
        turn(:left)
      when "WEST"
        turn(:left)
        turn(:left)
      when "NORTH"
        turn(:right)
      end
    end

    def turn_south
      case @direction
      when "WEST"
        turn(:left)
      when "NORTH"
        turn(:left)
        turn(:left)
      when "EAST"
        turn(:right)
      end
    end

    def turn_west
      case @direction
      when "NORTH"
        turn(:left)
      when "EAST"
        turn(:left)
        turn(:left)
      when "SOUTH"
        turn(:right)
      end
    end

    def report
      {
        north: @north,
        east: @east,
        direction: @direction
      }
    end

    def next_move
      case @direction
      when "NORTH"
        [@east, @north + 1]
      when "SOUTH"
        [@east, @north  -1]
      when "EAST"
        [@east + 1, @north]
      when "WEST"
        [@east - 1, @north]
      end
    end

    def move_up
      turn_north
      move
    end

    def move_down
      turn_south
      move
    end

    def move_left
      turn_west
      move
    end

    def move_right
      turn_east
      move
    end


  end
end
