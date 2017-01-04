class Direction
  ALL = %w(NORTH EAST SOUTH WEST)

  def initialize(direction)
    @direction = direction
  end

  def next
    ALL.at(index + 1) || ALL.at(0)
  end

  def previous
    ALL.at(index - 1) || ALL.at(-1)
  end

  private

  def index
    ALL.index(@direction)
  end
end
