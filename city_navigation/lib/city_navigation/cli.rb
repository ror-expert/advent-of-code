module CityNavigation
  class CLI
    attr_reader :simulator

    def initialize()
      city_grid = CityNavigation::CityGrid.new(1000,1000)
      @simulator = CityNavigation::Simulator.new(city_grid)
    end


  end

end
