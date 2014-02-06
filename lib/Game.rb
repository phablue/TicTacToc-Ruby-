require_relative "game_board"
require_relative "game_rules"
require_relative "human"
require_relative "computer"
class Game

	def initialize
		@player1 = "X"
		@player2 = "O"
		@game_continue = true
		@board = GameBoard.new
		@rules = GameRules.new
		@human = Human.new
		@computer = Computer.new
	end

	def welcome_msg
		puts "\nWelcome to TicTacToe !\n\n"
	end

	def user_win_msg
		puts "\nCongratulations~ You win !!" 
	end

	def computer_win_msg
		puts "\nSorry.. Computer win.."
	end

	def tie_msg
		puts "\nGame is tie" 
	end

	def gameover_msg
		puts "Game Over"
	end

	def end_of_game_msg(current_player)
		if current_player == @player1 && @rules.game_win(@board)
			user_win_msg
		elsif current_player == @player2 && @rules.game_win(@board)
			computer_win_msg
		elsif @rules.game_tie(@board)
			tie_msg
		end			
		gameover_msg
	end

	def ask_yes_no
		print "\nDo you require the first move? (y/n): "
	end

	def go_first
		ask_yes_no
		answer = gets.chomp
		if answer == "y"
			return @player1
		elsif answer == "n"			
			return @player2
		else
			print "\nYou have to enter 'y' or 'n'\n"
			go_first
		end
	end

	def change_player(current_player)
		(current_player == @player1) ? @player2 : @player1
	end	

	def play
		welcome_msg
		@board.show_board
		first = go_first
		while @game_continue
			if first == @player1
				current_player = first
				@human.choose_spot(@board, current_player)
				@board.show_board
				break if @rules.game_over(@board)
				current_player = change_player(current_player)
				@computer.choose_spot(@board, current_player)
				@board.show_board
				break if @rules.game_over(@board)
			else
				current_player = first
				@computer.choose_spot(@board, current_player)
				@board.show_board
				break if @rules.game_over(@board)
				current_player = change_player(current_player)
				@human.choose_spot(@board, current_player)
				@board.show_board
				break if @rules.game_over(@board)				
			end
		end
		end_of_game_msg(current_player)
	end
end
