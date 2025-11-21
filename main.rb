# mastermind game gets started.
# computer selects a secret code (made up of four pegs each randomly selected to be one of six colors).
# player puts in a four peg code to test and the computer checks it against the secret code.
# computer shows with red pegs the number of correct color pegs in the correct place.
# computer shows with white pegs the number of correct color peg in the wrong place.
# player gets a total of 12 guesses repeating the past three steps.
# if a correct guess, player wins
# else, after 12 guesses computer wins.
#
# player to choose if they are the code maker or breaker
# if they choose breaker, see code below
# if they choose maker, player to make a code that gets given to the board
# then, a computer_codebreaker follows an algorithm to guess the code.
# the board with the guesses gets printed

require 'colorize'
require './board'
require './computer_codemaker'
require './player_codemaker'
require './computer_codebreaker'
require './player_codebreaker'

def play_game(codemaker, codebreaker)
  answer = codemaker.set_code
  current_board = Board.new(answer)

  game_instructions if codebreaker.instance_of?(PlayerCodebreaker)
  # create player codebreaker class that handles the generation of guess codes.
  # give this player to game_rounds to aks for player.get_guess
  # this can also be used for the computer guesser so game_rounds is usable for both.
  game_rounds(current_board, codebreaker)

  puts 'The code was: '
  current_board.give_colors(answer)
  puts
end

def game_rounds(board, codebreaker)
  count = 0
  while count < 12
    guess = codebreaker.get_guess
    board.guess(guess)
    placement_key = board.placement?(guess)
    board.show if codebreaker.instance_of?(PlayerCodebreaker)

    if board.win?(guess)
      board.show if codebreaker.instance_of?(ComputerCodebreaker)
      puts 'YOU GOT IT!'.colorize(:green)
      break
    end

    temp_guess = guess.dup
    spare_key = placement_key.dup
    codebreaker.trim_codes(temp_guess, spare_key) if codebreaker.instance_of?(ComputerCodebreaker)
    count += 1
  end
end

def game_instructions
  print 'Correct location: '
  print '● '.colorize(:black)
  puts
  print 'Correct color: '
  print '● '.colorize(:white)
  puts
end

def start
  puts 'Choose your game option ([1] codemaker, [2] codebreaker): '
  choice = gets.chomp.downcase
  codemaker = ''
  codebreaker = ''

  loop do
    if choice == '1'
      codemaker = PlayerCodemaker.new
      codebreaker = ComputerCodebreaker.new
      break
    elsif choice == '2'
      codemaker = ComputerCodemaker.new
      codebreaker = PlayerCodebreaker.new
      break
    else
      puts 'Choose a valid option ([1] codemaker, [2] codebreaker): '
      choice = gets.chomp.downcase
    end
  end

  play_game(codemaker, codebreaker)
end

loop do
  start

  puts 'play again? (y/n)'
  response = gets.chomp.downcase

  break if response == 'n'
end
