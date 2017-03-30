module KeypadNavigation
  class CLI
    attr_reader :simulator

    def initialize()
      keypad_grid = KeypadNavigation::KeypadGrid.new(2,2)
      @simulator = KeypadNavigation::Simulator.new(keypad_grid)
    end

    def load_commands(commands_file)
      File.readlines(commands_file).map do |command|
        KeypadNavigation::Command.process(command)
      end
    end

    def run(commands)
      commands.each do |command, *args|
        simulator.send(command, *args)
      end
    end

  end
end
