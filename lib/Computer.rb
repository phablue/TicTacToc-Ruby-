require_relative "GameRules"

class Computer

	def initialize
		@rules = GameRules.new
	end

	def choose_spot(board, current_player)
		puts "Please wait to computer play.."
		choice = minimax(board, current_player)[1]
		board.mark_choice_spot(choice, current_player)
	end

	def minimax(board, current_player, level = 0)
		point = -1
		best_point = -1
		best_spot = nil
		level = level
		return get_point(board, current_player, level), nil if @rules.game_over(board)
			board.available_spots.each do |spot|
		 		board.mark_choice_spot(spot, current_player)
		 		point = -minimax(board, change_player(current_player), level += 1)[0]
		 		board.mark_choice_spot(spot, spot)
		 		if point > best_point
		 			best_point = point
		 			best_spot = spot
		 		end
		 	end
		 return [best_point, best_spot]
	 end

	def get_point(board, current_player, level)
		return (1.0 / -level) if @rules.game_win(board) 
		return 0		
	end

	def change_player(current_player)
		(current_player == "X") ? "O" : "X"
	end
end
