class Human

	def choose_spot(board, current_player)
		print choose_msg
		user_input = gets.chomp
		if board.available_spots.include?(user_input) 
			board.mark_choice_spot(user_input, current_player)
		else 
			unavailable_spot(board, current_player)  
		end
	end

	def choose_msg
		"Enter a number of your choice : "
	end

	def err_msg
		"That is not an available number. Please choose a different number."
	end

	def unavailable_spot(board, current_player)  
		puts err_msg
		choose_spot(board, current_player)
	end

end

