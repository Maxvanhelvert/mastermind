class PlayerCodebreaker
  CHOICES = %w[red blue yellow cyan green purple]

  def initialize
    @guess = []
  end

  def get_guess
    @guess = []
    while @guess.length < 4
      puts "Choose color number #{@guess.length + 1}:"
      puts 'Choices (red, blue, yellow, cyan, green, purple)'
      choice = gets.chomp.downcase
      unless CHOICES.include?(choice)
        loop do
          puts 'Choose a valid option:'.colorize(:red)
          puts 'Choices (red, blue, yellow, cyan, green, purple)'
          choice = gets.chomp.downcase
          break if CHOICES.include?(choice)
        end
      end
      puts ' '
      @guess.append(choice)
    end
    @guess
  end
end
