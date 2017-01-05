require_relative '../command'

module Commands
  class ExitCommand < ::Command
    def execute
      if @command.match(/^EXIT$/i)
        puts "Exitng..."
      else
        puts 'Invalid command'
      end
    end

    def exit?
      true
    end
  end
end
