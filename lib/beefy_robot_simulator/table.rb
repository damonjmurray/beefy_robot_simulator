class Table
  attr_reader :positions

  def initialize
    # a table has 5x5 positions that can be occupied
    @positions = x_range.product(y_range)
                   .map { |x, y| { x: x, y: y, occupant: nil } }
  end

  def set_item_at_position(item, x, y)
    index = @positions.index { |p| p[:x] == x && p[:y] == y }
    position = positions[index].clone
    position[:occupant] = item

    @positions[index] = position
  end

  def x_range
    (0..4).to_a
  end

  def y_range
    (0..4).to_a
  end
end
