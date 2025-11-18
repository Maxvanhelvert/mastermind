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
    # loop that breaks at count >= @guesses.length
    # print give_color(@guesses[count])
    # print placement?(@keys[count])
    @guesses.each_with_index do |guess, index|
      print "#{index + 1} "
      give_colors(guess)
      placement?(guess)
      puts ' '
    end
    puts ' '
  end

  def placement?(guess)
    # run this after guess is made to check each guess
    # then store in @keys to be printed after the guess
    clone_answer = @answer.dup
    clone_guess = guess.dup

    print 'Key: '
    exact_match?(clone_answer, clone_guess)
    included?(clone_answer, clone_guess)
    # current bug:
    # deleting from the array not always working correctly
    # sometimes gives 5 "correct" guesses
  end

  def exact_match?(answer, guess)
    clone_answer = answer.dup
    clone_guess = guess.dup

    clone_guess.each_with_index do |pin, i|
      next unless clone_answer[i] == pin

      print '● '.colorize(:black)
      answer.delete_at(i)
      guess.delete_at(i)
    end
  end

  def included?(answer, guess)
    clone_answer = answer.dup
    clone_guess = guess.dup

    clone_guess.each do |i|
      clone_answer.each do |j|
        next unless i == j

        print '● '.colorize(:white)
        answer.delete(j)
        guess.delete(i)
        break
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
