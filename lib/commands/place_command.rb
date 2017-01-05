require_relative '../command'

module Commands
  class PlaceCommand < ::Command
    MATCH_REGEX = /^PLACE\s+(-{0,1}\d+)\s*,\s*(-{0,1}\d+)\s*,\s*(NORTH|SOUTH|EAST|WEST)$/i

    def execute
      if @command.match(MATCH_REGEX)
        @robot.place($1.to_i, $2.to_i, $3.upcase)
      else
        puts 'Place command format is not correct'
      end
    end
  end
end
