class Table
  X_MIN, X_MAX = 0, 4
  Y_MIN, Y_MAX = 0, 4

  attr_reader :positions

  def initialize
    # a table has 5x5 positions that can be occupied
    @positions = x_range.product(y_range)
                   .map { |x, y| { x: x, y: y, occupant: nil } }
  end

  def item_at(x, y)
    fail ArgumentError, 'Invalid position' unless valid_position?(x, y)
    positions.detect { |p| p[:x] == x && p[:y] == y }[:occupant]
  end

  def position_of(item)
    @positions.detect { |p| p[:occupant] == item }
  end

  def remove_item_at_position(item, x, y)
    fail ArgumentError, 'Invalid position' unless valid_position?(x, y)

    index = @positions.index { |p| p[:x] == x && p[:y] == y }
    position = positions[index].clone
    return unless position[:occupant] == item

    position[:occupant] = nil
    @positions[index] = position
  end

  def set_item_at_position(item, x, y)
    fail ArgumentError, 'Invalid position' unless valid_position?(x, y)

    index = @positions.index { |p| p[:x] == x && p[:y] == y }
    position = positions[index].clone
    position[:occupant] = item

    @positions[index] = position
  end

  def valid_position?(x, y)
    x_range.include?(x) && y_range.include?(y)
  end

  def x_range
    (X_MIN..X_MAX).to_a
  end

  def y_range
    (Y_MIN..Y_MAX).to_a
  end
end
