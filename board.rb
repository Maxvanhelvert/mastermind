class Board
  EMPTY_BOARD = []

  def initialize(answer)
    @game_board = EMPTY_BOARD.map(&:dup)
    @answer = answer
    @guesses = []
    @keys = []
  end

  def guess(guess)
    @guesses.append(guess)
    placement?(guess)
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
    count = 0
    # loop that breaks at count >= @guesses.length
    # print give_color(@guesses[count])
    # print placement?(@keys[count])
    while count < @guesses.length
      print "#{count + 1} "
      give_colors(@guesses[count])
      print 'Key: '
      key_colors(@keys[count])
      puts
      break if count == @guesses.length

      count += 1
    end
    puts ' '
  end

  def placement?(guess)
    # run this after guess is made to check each guess
    # then store in @keys to be printed after the guess
    clone_answer = @answer.dup
    clone_guess = guess.dup
    temp_key = []

    exact_match?(clone_answer, clone_guess, temp_key)
    included?(clone_answer, clone_guess, temp_key)
    @keys.append(temp_key)
  end

  def exact_match?(answer, guess, key)
    clone_answer = answer.dup
    clone_guess = guess.dup

    clone_guess.each_with_index do |pin, i|
      next unless clone_answer[i] == pin

      key.append('exact')
      answer.delete_at(i)
      guess.delete_at(i)
    end
    key
  end

  def included?(answer, guess, key)
    clone_answer = answer.dup
    clone_guess = guess.dup

    clone_guess.each do |i|
      clone_answer.each do |j|
        next unless i == j

        key.append('almost')
        answer.delete(j)
        guess.delete(i)
        break
      end
    end
    key
  end

  def give_colors(pins)
    pins.each do |pin|
      if pin == 'red'
        print '● '.colorize(:red)
      elsif pin == 'blue'
        print '● '.colorize(:blue)
      elsif pin == 'yellow'
        print '● '.colorize(:yellow)
      elsif pin == 'cyan'
        print '● '.colorize(:cyan)
      elsif pin == 'green'
        print '● '.colorize(:green)
      elsif pin == 'purple'
        print '● '.colorize(:magenta)
      else
        print pin
      end
    end
  end
end

def key_colors(pins)
  pins.each do |pin|
    if pin == 'exact'
      print '● '.colorize(:black)
    elsif pin == 'almost'
      print '● '.colorize(:white)
    else
      print 'what are you doing?'
    end
  end
end
