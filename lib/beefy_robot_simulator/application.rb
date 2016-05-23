class Application
  attr_reader :robot, :table

  def initialize
    @robot = Robot.new
    @table = Table.new
  end

  def place(x, y, direction)
    @robot.change_direction(direction)
    @table.set_item_at_position(@robot, x, y)
  end

  def left
    # TODO: change robot's direction 90 degrees to the left
    raise NotImplementedError
  end

  def right
    # TODO: change robot's direction 90 degrees to the right
    raise NotImplementedError
  end

  def move
    # TODO: change position of robot on board by one unit in the
    #       direction the robot is currently facing
    raise NotImplementedError
  end

  def report
    # TODO: report the current position and direction of the robot
    raise NotImplementedError
  end
end
