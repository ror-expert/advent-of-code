module KeypadNavigation
  class KeypadGrid
    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    def valid_location?(east, north)

      (-@longitude..@longitude).cover?(north) && (-@latitude..@latitude).cover?(east)
      # (-@latitude...@latitude).cover?(-east)
      # (-@longitude...@longitude).cover?(-north)

      # puts "The latitude range: #{(-@latitude..@latitude)}"
      # puts "The longitude range: #{(-@longitude..@longitude)}"
      #
      # puts "Testing latitude of (#{east}, #{north}) #{(-@latitude..@latitude).cover?(east)}"
      # puts "Testing longitude of (#{east}, #{north}): #{(-@longitude..@longitude).cover?(north)}"

    end
  end
end


# testing = KeypadNavigation::KeypadGrid.new(1,1)
# testing.valid_location?(-1,1)
# testing.valid_location?(-5,1)
