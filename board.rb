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
      placement?(guess)
      puts ' '
    end
    puts ' '
  end

  def placement?(guess)
    temp_answer = @answer.clone

    print 'Key: '
    exact_match?(temp_answer, guess)
    included?(temp_answer, guess)
  end

  def exact_match?(answer, guess)
    guess.each_with_index do |pin, i|
      next unless answer[i] == pin

      print '● '.colorize(:black)
      answer.delete_at(i)
      guess.delete_at(i)
    end
  end

  def included?(answer, guess)
    guess.each_with_index do |_, i|
      answer.each_with_index do |_, j|
        next unless guess[i] == answer[j]

        print '● '.colorize(:white)
        answer.delete_at[j]
        guess.delete_at[i]
      end
    end
  end

  def give_colors(pins)
    pins.each do |pin|
      if pin == 'red'
        print '●'.colorize(:red)
      elsif pin == 'blue'
        print '●'.colorize(:blue)
      elsif pin == 'yellow'
        print '●'.colorize(:yellow)
      elsif pin == 'cyan'
        print '●'.colorize(:cyan)
      elsif pin == 'green'
        print '●'.colorize(:green)
      elsif pin == 'purple'
        print '●'.colorize(:magenta)
      else
        print pin
      end
      print ' '
    end
  end
end
