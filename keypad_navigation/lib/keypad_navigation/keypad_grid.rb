module KeypadNavigation
  class KeypadGrid
    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    def valid_location?(east, north)

      (-@latitude...@latitude).cover?(east)
      (-@latitude...@latitude).cover?(-east)
      (-@longitude...@longitude).cover?(north)
      (-@longitude...@longitude).cover?(-north)

    end
  end
end
