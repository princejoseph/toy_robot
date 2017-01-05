require_relative 'command_parser'

class Command
  def initialize(command, robot)
    @command = command.to_s.strip
    @robot = robot
  end

  def execute
    parser.parse
    case parser.type
    when :place
      @robot.place(parser.x, parser.y, parser.direction)
    when :move
      @robot.move
    when :left
      @robot.turn_left
    when :right
      @robot.turn_right
    when :report
      @robot.report
    when :exit
      puts 'Exiting....'
    else
      puts 'Please enter a valid command'
    end
  end

  def exit_command?
    parser.type == :exit
  end

  private

  def parser
    @parser ||= CommandParser.new(@command)
  end
end
