class GameRules

	def win_requirement_row(board)
		board.row_spots.each do |spot| 
			return true if spot.uniq.length == 1
		end
	end

	def win_requirement_column(board)
		board.row_spots.transpose.each do |spot|
			return true if spot.uniq.length == 1
		end
	end

	def win_requirement_diagonal(board)
		return true if board.spots.values_at(0,4,8).uniq.length == 1
		return true if board.spots.values_at(2,4,6).uniq.length == 1
	end

	def win_requirement_total(board)
		return true if win_requirement_row(board) == true
		return true if win_requirement_column(board) == true
		return true if win_requirement_diagonal(board) == true
	end

end