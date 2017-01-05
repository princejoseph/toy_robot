require_relative '../command'

module Commands
  class RightCommand < ::Command
    def execute
      if @command.match(/^RIGHT$/i)
        @robot.turn_right
      else
        puts 'Right command format is not correct'
      end
    end
  end
end
