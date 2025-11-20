class PlayerCodebreaker
  CHOICES = %w[red blue yellow cyan green purple]
  NEW_GUESS = []

  def initialize
    @guess = NEW_GUESS.dup
  end

  def get_guess
    p 'player codebreaker get_guess'
    @guess = NEW_GUESS.dup
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
