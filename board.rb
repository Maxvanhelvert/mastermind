class Board
  EMPTY_BOARD = []

  def initialize(answer)
    @game_board = EMPTY_BOARD.map(&:dup)
    @answer = answer
    @guesses = []
  end

  def guess(guess)
    @guesses.append(guess)
    show
    puts 'YOU GOT IT!'.colorize(:green) if win?(guess)
    win?(guess)
  end

  def win?(guess)
    guess == @answer
  end

  def show
    puts ' '
    puts 'Your guesses:'
    @guesses.each_with_index do |guess, index|
      print "#{index + 1} "
      give_colors(guess)
      puts ' '
    end
    puts ' '
  end

  def give_colors(pins)
    pins.each do |pin|
      if pin == 'red'
        print pin.colorize(:red)
      elsif pin == 'blue'
        print pin.colorize(:blue)
      elsif pin == 'yellow'
        print pin.colorize(:yellow)
      elsif pin == 'cyan'
        print pin.colorize(:cyan)
      elsif pin == 'green'
        print pin.colorize(:green)
      elsif pin == 'purple'
        print pin.colorize(:magenta)
      else
        print pin
      end
      print ' '
    end
  end
end
