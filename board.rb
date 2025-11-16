class Board
  EMPTY_BOARD = []

  def initialize(answer)
    @game_board = EMPTY_BOARD.map(&:dup)
    @answer = answer
  end
end
