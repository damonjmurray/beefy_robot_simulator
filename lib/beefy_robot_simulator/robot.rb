class Robot
  attr_reader :direction, :name

  def initialize
    @name = 'BEEFY'
    @direction = nil
  end

  def change_direction(new_direction)
    @direction = new_direction
  end
end
