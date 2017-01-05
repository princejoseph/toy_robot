require_relative '../command'

module Commands
  class ReportCommand < ::Command
    def execute
      if @command.match(/^REPORT$/i)
        @robot.report
      else
        puts 'Report command format is not correct'
      end
    end
  end
end
