class ComputerCodebreaker
  CHOICES = %w[red blue yellow cyan green purple]

  def initialize
    @knuth_codes = []
    @possible_codes = []
    @total_codes = []

    create_all_codes
  end

  def create_all_codes
    @possible_codes = CHOICES.repeated_permutation(4).to_a
    @knuth_codes = @possible_codes
  end

  def get_guess
    # first guess to be CHOICES[0], CHOICES[0], CHOICES[1], CHOICES[1] (Could it be just random first guess?)
    # trim possible codes/knuth codes for only ones that give the same result as first guess
    # then, get random guess from possible guesses
    # return guess to board
    @knuth_codes.sample
  end

  # something here makes it sometimes return a's and g's as answer, some fault in the checking algorithm
  # now it is trimming too many codes - somehow trimming things from Board

  def trim_codes(guess, key)
    # run each knuth code against last guess
    # if key != answer, trim knuth code
    dup_knuth = @knuth_codes.dup
    @knuth_codes.each do |try_code|
      next if placement?(guess, try_code) == key

      dup_knuth.delete(try_code)
    end

    @knuth_codes = dup_knuth
  end

  def placement?(guess, knuth_code)
    clone_answer = guess.dup
    clone_guess = knuth_code.dup
    temp_key = []

    exact_match?(clone_answer, clone_guess, temp_key)
    included?(clone_answer, clone_guess, temp_key)

    temp_key
  end

  def exact_match?(answer, guess, key)
    guess.each_with_index do |pin, i|
      next unless answer[i] == pin

      key.append('exact')
      answer[i] = 'a'
      guess[i] = 'g'
    end
    key
  end

  def included?(answer, guess, key)
    guess.each_with_index do |g_pin, i|
      answer.each_with_index do |a_pin, j|
        next unless g_pin == a_pin

        key.append('almost')
        answer[j] = 'a'
        guess[i] = 'g'
        break
      end
    end
    key
  end
end
