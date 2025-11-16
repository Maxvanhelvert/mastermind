class ComputerCodemaker
  NEW_CODE = []
  CHOICES = %w[red blue yellow cyan green purple]

  def initialize
    @code = NEW_CODE
  end

  def set_code
    while @code.length < 6
      choice = CHOICES.sample
      @code.append(choice)
    end
    @code
  end
end
