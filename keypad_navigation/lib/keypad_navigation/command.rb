module KeypadNavigation
  class Command
    def self.process(command)
      case command
      when /\APLACE (?<x>\D\d+),(?<y>\d+),(?<direction>\w+)\Z/
        [:place, $1.to_i, $2.to_i, $3]
      when /\AMOVE\Z/
        [:move]
      when /\ALEFT\Z/
        [:turn_left]
      when /\ARIGHT\Z/
        [:turn_right]
      when /\TURN_NORTH\Z/
        [:turn_north]
      when /\TURN_SOUTH\Z/
        [:turn_south]
      when /\TURN_EAST\Z/
        [:turn_east]
      when /\TURN_WEST\Z/
        [:turn_west]
      when /\AMOVE_UP\Z/
        [:move_up]
      when /\AMOVE_DOWN\Z/
        [:move_down]
      when /\AMOVE_LEFT\Z/
        [:move_left]
      when /\AMOVE_RIGHT\Z/
        [:move_right]
      when /\AREPORT\Z/
        [:report]
      when /\AKEYPAD_REPORT\Z/
        [:keypad_report]
      else
        [:invalid, command]
      end
    end
  end
end
