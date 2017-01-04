class Position < Struct.new(:x, :y)
  TABLE_LENGTH = 5
  TABLE_BREADTH = 5

  def valid?
    x_range.include?(x) && y_range.include?(y)
  end

  def next(direction)
    next_x, next_y = x, y
    case direction
    when 'NORTH'
      next_y += 1
    when 'SOUTH'
      next_y -= 1
    when 'EAST'
      next_x += 1
    when 'WEST'
      next_x -= 1
    end
    Position.new(next_x, next_y)
  end

  private

  def x_range
    (0...TABLE_LENGTH)
  end

  def y_range
    (0...TABLE_BREADTH)
  end
end
