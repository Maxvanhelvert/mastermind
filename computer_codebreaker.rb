class ComputerCodebreaker
  EMPTY_CODE_LIST = []
  CHOICES = %w[red blue yellow cyan green purple]

  def initialize
    @knuth_codes = EMPTY_CODE_LIST
    @possible_codes = EMPTY_CODE_LIST
    @total_codes = EMPTY_CODE_LIST
  end

  def create_all_codes
    CHOICES.each do |i|
      CHOICES.each do |j|
        CHOICES.each do |m|
          CHOICES.each do |n|
            current_code = [i, j, m, n]
            @possible_codes.push(current_code)
          end
        end
      end
    end
    puts @possible_codes.length
  end
end
