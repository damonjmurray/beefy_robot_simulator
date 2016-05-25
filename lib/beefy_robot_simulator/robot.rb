class Robot
  attr_reader :direction, :name

  def initialize
    @name = 'BEEFY'
    @direction = nil
  end

  def set_direction(new_direction)
    return unless Direction::valid?(new_direction)
    @direction = new_direction
  end

  def turn_left
    return if @direction.nil?
    @direction = Direction::left_from(@direction)
  end

  def turn_right
    return if @direction.nil?
    @direction = Direction::right_from(@direction)
  end
end
