require 'colorize'
require 'artii'
require_relative 'lib/toy_robot'
require_relative 'lib/command'

a = Artii::Base.new :font => 'slant'
puts a.asciify('Toy Robot Simulator!')

robot = ToyRobot.new

puts "\n\nPlease enter commands (exit to leave):\n".cyan

loop.with_index do |_, i|
  print "trs :#{(i + 1).to_s.rjust(3, '0')} > ".green
  input = gets.chomp
  command_obj = Command.new(input, robot)
  command_obj.execute
  break if command_obj.exit_command?
end
