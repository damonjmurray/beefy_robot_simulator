class Application
  attr_reader :robot, :table

  def initialize
    @robot = Robot.new
    @table = Table.new
  end
end
