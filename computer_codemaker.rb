class ComputerCodemaker
  CHOICES = %w[red blue yellow cyan green purple]

  def initialize
    @code = []
  end

  def set_code
    while @code.length < 4
      choice = CHOICES.sample
      @code.append(choice)
    end
    @code
  end
end
