class Application
  attr_reader :robot, :table

  def initialize
    @robot = Robot.new
    @table = Table.new
  end

  def place(x, y, direction)
    # remove the robot from the table if it has already been placed
    current_position = @table.position_of(@robot)
    unless current_position.nil?
      @table.remove_item_at_position(@robot, current_position[:x], current_position[:y])
    end

    @robot.set_direction(direction)
    @table.set_item_at_position(@robot, x, y)
  end

  def left
    return if @table.position_of(@robot).nil?
    @robot.turn_left
  end

  def right
    return if @table.position_of(@robot).nil?
    @robot.turn_right
  end

  def move
    # TODO: change position of robot on board by one unit in the
    #       direction the robot is currently facing
    raise NotImplementedError
  end

  def report
    current_position = @table.position_of(@robot)
    return if current_position.nil?

    "#{current_position[:x]},#{current_position[:y]},#{@robot.direction.upcase}"
  end
end
