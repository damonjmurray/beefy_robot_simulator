module Direction
  NORTH = :north
  EAST = :east
  SOUTH = :south
  WEST = :west

  @@clockwise_cycle = [NORTH, EAST, SOUTH, WEST]

  def self.valid?(direction)
    @@clockwise_cycle.include?(direction)
  end

  def self.left_from(direction)
    fail ArgumentError, 'Not a valid direction' unless Direction::valid?(direction)

    index = @@clockwise_cycle.index(direction)
    @@clockwise_cycle[index - 1]
  end

  def self.right_from(direction)
    fail ArgumentError, 'Not a valid direction' unless Direction::valid?(direction)

    # make use of ruby's negative indicies so this works at the upper bound
    index = @@clockwise_cycle.index(direction) - @@clockwise_cycle.size
    @@clockwise_cycle[index + 1]
  end
end

