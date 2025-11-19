# mastermind game gets started.
# computer selects a secret code (made up of four pegs each randomly selected to be one of six colors).
# player puts in a four peg code to test and the computer checks it against the secret code.
# computer shows with red pegs the number of correct color pegs in the correct place.
# computer shows with white pegs the number of correct color peg in the wrong place.
# player gets a total of 12 guesses repeating the past three steps.
# if a correct guess, player wins
# else, after 12 guesses computer wins.

require 'colorize'
require './board'
require './computer_codemaker'

def play_game
  computer = ComputerCodemaker.new
  answer = computer.set_code
  current_board = Board.new(answer)

  game_instructions

  game_rounds(current_board)

  puts 'The code was: '
  current_board.give_colors(answer)
  puts
end

def game_rounds(board)
  count = 0
  while count < 12
    break if board.guess(get_guess)

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

def get_guess
  guess = []
  choices = %w[red blue yellow cyan green purple]

  while guess.length < 4
    puts "Choose color number #{guess.length + 1}:"
    puts 'Choices (red, blue, yellow, cyan, green, purple)'
    choice = gets.chomp.downcase
    unless choices.include?(choice)
      loop do
        puts 'Choose a valid option:'
        puts 'Choices (red, blue, yellow, cyan, green, purple)'
        choice = gets.chomp.downcase
        break if choices.include?(choice)
      end
    end
    puts ' '
    guess.append(choice)
  end
  guess
end

play_game
