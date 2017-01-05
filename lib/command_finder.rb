Dir[File.join(File.dirname(__FILE__), 'commands/*')].each do |f|
  require f
end

class CommandFinder
  KLASS_HASH = {
    place: Commands::PlaceCommand,
    move: Commands::MoveCommand,
    right: Commands::RightCommand,
    left: Commands::LeftCommand,
    report: Commands::ReportCommand,
    exit: Commands::ExitCommand
  }

  def initialize(robot)
    @robot = robot
  end

  def determine_command_object(command)
    command_name = command.split(' ').first.downcase.to_sym
    command_klass = KLASS_HASH[command_name] || Command
    command_klass.new(command, @robot)
  end
end
