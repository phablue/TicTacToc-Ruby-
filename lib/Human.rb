class Human

	def choose_spot(board, current_player)
		choose_msg
		user_input = gets.chomp
		print "\n"
		if board.available_spots.include?(user_input)
			board.mark_choice_spot(user_input, current_player)
		else
			unavailable_spot(board, current_player)
		end
	end

	def choose_msg
		print "\nEnter a number of your choice : "
	end

	def err_msg
		print "\nThat is not an available number. Please choose a different number."
	end

	def unavailable_spot(board, current_player)
		err_msg
		choose_spot(board, current_player)
	end

end
