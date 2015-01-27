class GameRules
  def game_over(board)
    game_win(board) || game_tie(board)
  end

  def game_win(board)
    win_requirements(board.row_spots) || win_requirements(board.column_spots) || win_requirements(board.diagonal_spots)
  end

  def game_tie(board)
    board.available_spots.empty?
  end

  def win_requirements(board_spots)
    board_spots.any? do |spot|
      spot.uniq.length == 1
    end
  end
end