require_relative '../command'

module Commands
  class MoveCommand < ::Command
    def execute
      if @command.match(/^MOVE$/i)
        @robot.move
      else
        puts 'Move command format is not correct'
      end
    end
  end
end
