class GamePlay

	def apply_choice_spot(player,board)
		puts choose_msg(player)
		user_input = gets.chomp
		if available_spot(user_input,board) 
			board.spots[user_input.to_i-1] = player
		else 
			unavailable_spot(player, board)  
		end
	end

	def current_player(player)
		if player == "X"
			return "player1"
		else
			return "player2"
		end
	end

	def choose_msg(player)
		return "[#{current_player(player)}] Enter a number of your choice : "
	end

	def available_spot(user_input,board)
		board.spots.include?(user_input) 
	end

	def err_msg
		return "That is not an available number. Please choose a different number."
	end

	def unavailable_spot(player, board)  
		puts err_msg
		apply_choice_spot(player, board)
	end

end

