class Human
  def initialize(input, output)
    @input = input
    @output = output
  end

  def choose_spot(board, current_player)
    ask_move
    check_available(board, current_player, user_input)
  end

  def check_available(board, current_player, user_input)
    if board.available_spots.include?(user_input)
      board.mark_choice_spot(user_input, current_player)
    else
      unavailable_spot(board, current_player)
    end
  end

  def unavailable_spot(board, current_player)
    raise_error
    choose_spot(board, current_player)
  end

  def ask_move
    @output.print_out(move_msg)
  end

  def user_input
    @input.get_input
  end

  def raise_error
    @output.print_out error_message
  end

  def move_msg
    "\nEnter a number of your choice : "
  end

  def error_message
    "\nThat is not an available number. Please choose a different number."
  end
end
