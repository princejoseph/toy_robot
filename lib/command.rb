class Command
  def initialize(command, robot)
    @command = command.to_s.strip
    @robot = robot
  end

  def execute
    puts "Command not implemented"
  end

  def exit?
    false
  end
end
