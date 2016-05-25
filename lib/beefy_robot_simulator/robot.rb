class Robot
  attr_reader :direction, :name

  MOVE_STEP = 1

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

  def move_from(x, y)
    x_target, y_target = x, y

    case @direction
    when Direction::NORTH then y_target+=MOVE_STEP
    when Direction::EAST then x_target+=MOVE_STEP
    when Direction::SOUTH then y_target-=MOVE_STEP
    when Direction::WEST then x_target-=MOVE_STEP
    end

    { x: x_target, y: y_target }
  end
end
