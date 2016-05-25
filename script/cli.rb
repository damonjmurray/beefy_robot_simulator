#!/usr/bin/env ruby

# Command Line Interface util for the Beefy Robot Simulator
$LOAD_PATH.push File.join(File.dirname(__FILE__), '/../lib')
require 'beefy_robot_simulator'

EXIT_COMMANDS = %w[exit q quit]
BEEFY_COMMANDS = [
  { name: :place, format: /^PLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST)/ },
  { name: :move, format: /^MOVE/ },
  { name: :left, format: /^LEFT/ },
  { name: :right, format: /^RIGHT/ },
  { name: :report, format: /^REPORT/ }
]

def main
  puts 'Starting BEEFY ROBOT SIMULATOR...'
  app = Application.new
  if ARGV.empty?
    run_interactive(app)
  else
    run_script(app, ARGV[0])
  end
  puts 'Exiting BEEFY ROBOT SIMULATOR...'
end

def execute(app, command_name, args=[])
  begin
    case command_name
    when :place
      x = args[0].to_i
      y = args[1].to_i
      direction = args[2].downcase.to_sym
      app.place(x, y, direction)
    when :move then app.move
    when :left then app.left
    when :right then app.right
    when :report then puts app.report unless app.report.nil?
    end
  rescue ArgumentError
    # sink errors raised by invalid Direction parameters
  end
end

def get_command_from_input(input)
  command = BEEFY_COMMANDS.detect { |cmd| input =~ cmd[:format] }
  return if command.nil?
  # if the regex contains captures, pass them as args
  args = input.match(command[:format]).captures
  return command, args
end

def run_interactive(app)
  show_usage
  while input = gets.chomp
    break if EXIT_COMMANDS.include?(input.chomp.downcase)
    command, args = get_command_from_input(input)
    if command.nil?
      show_usage
      next
    end
    execute(app, command[:name], args)
  end
end

def run_script(app, file_path)
  File.readlines(file_path).each do |line|
    next if line.empty?
    puts line
    command, args = get_command_from_input(line)
    next if command.nil?
    execute(app, command[:name], args)
  end
end

def show_usage
  usage_string =<<EOS
Usage: COMMAND [PARAMS]
  Commands:
    PLACE X,Y,DIRECTION
    MOVE
    LEFT
    RIGHT
    REPORT
    (type 'quit', 'q' or 'exit' to QUIT)
  Direction:
    NORTH
    EAST
    SOUTH
    WEST
EOS
  puts usage_string
end

# snap, crackle, pop!
main
