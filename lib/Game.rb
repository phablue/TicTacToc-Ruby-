require_relative "game_board"
require_relative "game_rules"
require_relative "human"
require_relative "computer"

class Game
	attr_accessor :board

	def initialize(reader, writer)
		@player1 = "X"
		@player2 = "O"
		@game_continue = true
		@reader = reader
		@writer = writer
		@board = GameBoard.new
		@rules = GameRules.new
		@human = Human.new(@reader, @writer)
		@computer = Computer.new(@writer)
	end

	def show_msg(message)
		@writer.print_out(message)
	end

	def welcome_msg
		"\nWelcome to TicTacToe !\n\n"
	end

	def user_win_msg
		"\nCongratulations~ You win !!"
	end

	def computer_win_msg
		"\nSorry.. Computer win.."
	end

	def tie_msg
		"\nGame is tie"
	end

	def gameover_msg
		"\nGame Over\n"
	end

	def ask_yes_no
		"\nDo you require the first move? (y/n): "
	end

	def err_msg
		"\nYou have to enter 'y' or 'n'\n"
	end

	def end_of_game_msg(current_player)
		if current_player == @player1 && @rules.game_win(@board)
			show_msg(user_win_msg)
		elsif current_player == @player2 && @rules.game_win(@board)
			show_msg(computer_win_msg)
		elsif @rules.game_tie(@board)
			show_msg(tie_msg)
		end
	end

	def input
		@reader.get_input
	end

	def go_first
		show_msg(ask_yes_no)
		answer = input
		if answer == "y"
			return @player1
		elsif answer == "n"
			return @player2
		else
			show_msg(err_msg)
			go_first
		end
	end

	def change_player(current_player)
		(current_player == @player1) ? @player2 : @player1
	end

	def play
		show_msg(welcome_msg)
		@board.show_board
		first = go_first
		while @game_continue
			if first == @player1
				current_player = first
				@human.choose_spot(@board, current_player)
				@board.show_board
				break if @rules.game_over(@board)
				current_player = change_player(current_player)
				@computer.choose_the_best_spot(@board, current_player)
				@board.show_board
				break if @rules.game_over(@board)
			else
				current_player = first
				@computer.choose_the_best_spot(@board, current_player)
				@board.show_board
				break if @rules.game_over(@board)
				current_player = change_player(current_player)
				@human.choose_spot(@board, current_player)
				@board.show_board
				break if @rules.game_over(@board)
			end
		end
		end_of_game_msg(current_player)
		show_msg(gameover_msg)
	end
end
