class Robot
  attr_reader :direction, :name

  DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize
    @name = 'BEEFY'
    @direction = nil
  end

  def set_direction(new_direction)
    @direction = new_direction
  end

  def turn_left
    index = DIRECTIONS.index(@direction)
    DIRECTIONS[index - 1]
  end

  def turn_right
    # take advantage of ruby's negative indicies to
    # to make this work at the array boundary
    index = DIRECTIONS.index(@direction) - DIRECTIONS.size
    DIRECTIONS[index + 1]
  end
end
