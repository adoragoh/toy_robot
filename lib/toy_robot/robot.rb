module ToyRobot
  class Robot

    attr_reader :east, :north, :direction, :directions

    DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

    def initialize(east = 0, north = 0, direction = 'NORTH')
      @east = east
      @north = north
      @direction = direction
    end

    def move
      # case @direction
      # when "NORTH" then move_north
      # when "SOUTH" then move_south
      # when "EAST" then move_east
      # when "WEST" then move_west
      # end
      send("move_#{@direction.downcase}")
    end

    def move_east
      @east += 1
    end

    def move_west
      @east -= 1
    end

    def move_north
      @north += 1
    end

    def move_south
      @north -= 1
    end

    def turn(turn_direction)
      index = DIRECTIONS.index(@direction)
      rotations = turn_direction == :right ? 1 : -1
      @direction = DIRECTIONS.rotate(rotations)[index]
    end

    def turn_left
      # Code variation #1
      # Get the current direction
      # Change the current direction to index[current direction] - 1
      # @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % 4]

      # Code variation #2
      # @direction = case @direction
      # when "NORTH" then "WEST"
      # when "SOUTH" then "EAST"
      # when "EAST" then "NORTH"
      # when "WEST" then "SOUTH"
      # end

      # Code variation #3
      # index = DIRECTIONS.index(@direction)
      # @direction = DIRECTIONS.rotate(-1)[index]

      # Code variation #4 using turn(turn_direction) method
      turn(:left)
    end

    def turn_right
      # Code variation #1
      # Get the current direction
      # Change the current direction to index[current direction] - 1
      # @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % 4]

      # Code variation #2
      # @direction = case @direction
      # when "NORTH" then "EAST"
      # when "SOUTH" then "WEST"
      # when "EAST" then "SOUTH"
      # when "WEST" then "NORTH"
      # end

      # Code variation #3
      # index = DIRECTIONS.index(@direction)
      # @direction = DIRECTIONS.rotate(1)[index]

      # Code variation #4 using turn(turn_direction) method
      turn(:right)
    end

    def report
      {
        east: @east,
        north: @north,
        direction: @direction
      }
    end

  end
end
