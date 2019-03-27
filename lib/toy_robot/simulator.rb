module ToyRobot
  # This class makes the robot do things based on commands
  # If the robot was a chess piece and the table was the chess board, the simulator is the person playing the game and moving the robot around the board
  # It can trigger the robot to use the methods in its class, ie. move and turn
  # It will only move the robot to places where it is allowed to, ie. cannot move outside the board
  # It can report the position that the robot is on the board at any given time
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
      return unless @table.valid_location?(robot.next_move.first, robot.next_move.last)
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
