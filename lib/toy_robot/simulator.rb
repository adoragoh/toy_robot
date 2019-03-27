module ToyRobot
  class Simulator

    attr_reader :robot

    def initialize(table)
      # Takes in a specific instance of a table
      @table = table
    end

    def place(east, north, facing)
      # Returns false and goes no further if the position given is not a valid position on the table (using a table method)
      return unless @table.valid_location?(east, north)
      # Creates a new instance of the robot if it is valid
      @robot = Robot.new(east, north, facing)
    end

    def move
      robot.move
    end

    def turn_left
      robot.turn_left
    end

    def turn_right
      robot.turn_right
    end

    def report
      position = robot.report
      puts "The robot is currently at #{position[:east]}, #{position[:north]} and is facing #{position[:direction]}."
    end

  end
end
