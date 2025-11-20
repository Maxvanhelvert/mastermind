class PlayerCodemaker
  NEW_CODE = []
  CHOICES = %w[red blue yellow cyan green purple]

  def initialize
    @code = NEW_CODE
  end

  def set_code
    while @code.length < 4
      puts "Choose color number #{@code.length + 1}:"
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
      @code.append(choice)
    end
    @code
  end
end
