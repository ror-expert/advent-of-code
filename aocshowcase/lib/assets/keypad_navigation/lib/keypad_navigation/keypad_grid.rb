module KeypadNavigation
  class KeypadGrid
    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    def valid_location?(east, north)

      ## Part 1 of Day 2
      (-@longitude..@longitude).cover?(north) && (-@latitude..@latitude).cover?(east) &&
      ## Part 2 of Day 2
      (north.abs + east.abs) < 3

      # puts "This is the absolute north: #{north.abs}"
      # puts "This is absolute east: #{east.abs}"
      # puts "This is the longitude test: #{(-@longitude..@longitude).cover?(north)}"
      # puts "This is the latitude test: #{(-@latitude..@latitude).cover?(east)}"
      # puts "This is to test whether the aggregate values are within range: #{(north.abs + east.abs) < 3}"

    end

    # def valid_location?(east, north)
    #
    #   (-@longitude..@longitude).cover?(north) && (-@latitude..@latitude).cover?(east)
    #
    # end
  end
end


# testing = KeypadNavigation::KeypadGrid.new(2,2)
#
# testing.valid_location?(0,2)
# testing.valid_location?(0,1)
# testing.valid_location?(0,0)
# testing.valid_location?(0,-1)
# testing.valid_location?(0,-2)
#
# testing.valid_location?(-1,2)
# testing.valid_location?(-1,1)
# testing.valid_location?(-1,0)
# testing.valid_location?(-1,-1)
# testing.valid_location?(-1,-2)
