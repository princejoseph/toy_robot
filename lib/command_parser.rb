class CommandParser
  attr_reader :type, :x, :y, :direction

  def initialize(command)
    @command = command
  end

  def parse
    case @command
    when /^PLACE\s+(\d+)\s*,\s*(\d+)\s*,\s*(NORTH|SOUTH|EAST|WEST)$/i
      @type = :place
      @x = $1.to_i
      @y = $2.to_i
      @direction = $3.upcase
    when /^MOVE$/i
      @type = :move
    when /^LEFT$/i
      @type = :left
    when /^RIGHT$/i
      @type = :right
    when /^REPORT$/i
      @type = :report
    when /^exit$/i
      @type = :exit
    end
  end
end
