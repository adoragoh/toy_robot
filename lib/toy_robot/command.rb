module ToyRobot
  class Command

    def self.process(command)
      # Code variation #1 where only parsing through the first place command (not invalid)
      # /\APLACE (?<x>\d+),(?<y>\d+),(?<direction>\w+)\Z/ =~ command
      # [:place, x.to_i, y.to_i, direction]

      # Code variation #2
      # if match = /\APLACE (?<x>\d+),(?<y>\d+),(?<direction>\w+)\Z/.match(command)
      #   [:place, match[:x].to_i, match[:y].to_i, match[:direction]]
      # else
      #   [:invalid, command]
      # end

      # Code variation #3
      case command
      when /\APLACE (?<x>\d+),(?<y>\d+),(?<direction>\w+)\Z/
        [:place, $~[:x].to_i, $~[:y].to_i, $~[:direction]]
      when /\AMOVE\Z/
        [:move]
      when /\ALEFT\Z/
        [:turn_left]
      when /\ARIGHT\Z/
        [:turn_right]
      when /\AREPORT\Z/
        [:report]
      else
        [:invalid, command]
      end
    end
  end
end
