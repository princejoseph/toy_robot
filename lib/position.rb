require_relative 'constants'

class Position < Struct.new(:x, :y)
  def x_range
    (0...TABLE_DIMENSIONS[:length])
  end

  def y_range
    (0...TABLE_DIMENSIONS[:breadth])
  end

  def valid?
    x_range.include?(x) && y_range.include?(y)
  end
end
