class ComputerCodebreaker
  EMPTY_CODE_LIST = []
  CHOICES = %w[red blue yellow cyan green purple]

  def initialize
    @knuth_codes = EMPTY_CODE_LIST
    @possible_codes = EMPTY_CODE_LIST
    @total_codes = EMPTY_CODE_LIST
  end

  def create_all_codes
    @possible_codes = CHOICES.repeated_permutation(4).to_a
  end

  def get_guess
    create_all_codes
    # first guess to be CHOICES[0], CHOICES[0], CHOICES[1], CHOICES[1] (Could it be just random first guess?)
    # trim possible codes/knuth codes for only ones that give the same result as first guess
    # then, get random guess from possible guesses
    # return guess to board
    p @possible_codes.sample
  end
end
