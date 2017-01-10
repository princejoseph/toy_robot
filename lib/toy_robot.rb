require_relative 'position'
require_relative 'direction'

class ToyRobot
  attr_reader :position, :direction

  def place(x, y, direction)
    position = Position.new(x, y)
    if position.valid?
      @position = position
      @direction = direction
    else
      puts 'Please enter a position within table 5,5.'
    end
  end

  def move
    if !placed?
      puts 'Please place the robot first!'
    elsif !safe_to_move?
      puts 'It is not safe to move to the entered position.'
    else
      @position = next_position
    end
  end

  def turn_left
    if placed?
      @direction = direction_obj.previous
    else
      puts 'Please place the robot first!'
    end
  end

  def turn_right
    if placed?
      @direction = direction_obj.next
    else
      puts 'Please place the robot first!'
    end
  end

  def report
    if placed?
      puts [@position.x, @position.y, @direction].join(',')
    else
      puts 'Toy Robot not yet placed'
    end
  end

  def sinspect
    "#<ToyRobot#{(" [#{report_string}]") if placed?}>"
  end

  private

  def placed?
    !@position.nil?
  end

  def report_string
    [@position.x, @position.y, @direction].join(',')
  end

  def direction_obj
    Direction.new(@direction)
  end

  def safe_to_move?
    next_position.valid?
  end

  def next_position
    @position.next(@direction)
  end
end
