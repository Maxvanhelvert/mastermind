# mastermind game gets started.
# computer selects a secret code (made up of four pegs each randomly selected to be one of six colors).
# player puts in a four peg code to test and the computer checks it against the secret code.
# computer shows with red pegs the number of correct color pegs in the correct place.
# computer shows with white pegs the number of correct color peg in the wrong place.
# player gets a total of 12 guesses repeating the past three steps.
# if a correct guess, player wins
# else, after 12 guesses computer wins.

# Objects:
#   - computer that selects secret code
#   - player? that handles player input?
#   - board that remembers the current board state and checks for correct inputs.
#   - board also checks if the code is guessed. (check for win.)

require 'colorize'
require './board'
require './computer_codemaker'

def play_game
  code = ComputerCodemaker.new
  answer = code.set_code
  Board.new(answer)
  give_colors(answer)
end

def give_colors(pins)
  pins.each do |pin|
    if pin == 'red'
      puts pin.colorize(:red)
    elsif pin == 'blue'
      puts pin.colorize(:blue)
    elsif pin == 'yellow'
      puts pin.colorize(:yellow)
    elsif pin == 'cyan'
      puts pin.colorize(:cyan)
    elsif pin == 'green'
      puts pin.colorize(:green)
    elsif pin == 'purple'
      puts pin.colorize(:magenta)
    else
      puts pin
    end
  end
end
play_game
