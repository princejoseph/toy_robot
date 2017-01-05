require 'readline'
require_relative 'autocompletion'
require 'colorize'
require 'artii'
require_relative 'lib/toy_robot'
require_relative 'lib/command'
require_relative 'lib/command_finder'

a = Artii::Base.new :font => 'slant'
puts a.asciify('Toy Robot Simulator!')

robot = ToyRobot.new

puts "\n\nPlease enter commands (exit to leave):\n".cyan

loop.with_index do |_, i|
  # To create an irb console like feel
  prompt = "trs :#{(i + 1).to_s.rjust(3, '0')} > ".green
  # get input from the user
  input = Readline.readline(prompt, true).to_s.strip
  finder = CommandFinder.new(robot)
  command_obj = finder.determine_command_object(input)
  command_obj.execute
  break if command_obj.exit?
end
