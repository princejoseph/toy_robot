require 'readline'

COMMAND_LIST = %w(PLACE MOVE LEFT RIGHT REPORT EXIT)
DIRECTION_LIST = %w(NORTH EAST SOUTH WEST)
LIST = (COMMAND_LIST + DIRECTION_LIST).sort

comp = proc { |s| LIST.grep( /^#{Regexp.escape(s)}/i ) }

Readline.completion_append_character = " "
Readline.completion_proc = comp
