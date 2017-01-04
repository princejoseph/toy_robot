require 'position'
require 'direction'

class ToyRobot
  attr_reader :position, :direction

  def place(x, y, direction)
    position = Position.new(x, y)
    return unless position.valid?
    @position = position
    @direction = direction
  end

  def move
    @position = next_position if safe_to_move?
  end

  def turn_left
    @direction = direction_obj.previous if placed?
  end

  def turn_right
    @direction = direction_obj.next if placed?
  end

  def report
    if placed?
      puts [@position.x, @position.y, @direction].join(',')
    else
      puts 'Toy Robot not yet placed'
    end
  end

  private

  def placed?
    !@position.nil?
  end

  def direction_obj
    Direction.new(@direction)
  end

  def safe_to_move?
    placed? && next_position.valid?
  end

  def next_position
    @position.next(@direction)
  end
end
