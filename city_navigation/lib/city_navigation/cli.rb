module CityNavigation
  class CLI
    attr_reader :simulator

    def initialize()
      city_grid = CityNavigation::CityGrid.new(1000,1000)
      @simulator = CityNavigation::Simulator.new(city_grid)
    end

    def load_commands(commands_file)
      File.readlines(commands_file).map do |command|
        CityNavigation::Command.process(command)
      end
    end

    def run(commands)
      commands.each do |command, *args|
        simulator.send(command, *args)
      end
    end

  end
end
