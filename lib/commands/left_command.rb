require_relative '../command'

module Commands
  class LeftCommand < ::Command
    def execute
      if @command.match(/^LEFT$/i)
        @robot.turn_left
      else
        puts 'Left command format is not correct'
      end
    end
  end
end
