require_relative "GameBoard"
require_relative "GameRules"
require_relative "Human"
require_relative "Computer"
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
		"\nWelcome to TicTacToe !"
	end

	def win_msg(player)
		return "\nCongratulations~ You win !!" if player == @player1 && @rules.game_win(@board)
		return "\nSorry.. Computer win.." if player == @player2 && @rules.game_win(@board)
	end

	def tie_msg
		return "Game is tie" if @rules.game_tie(@board)
	end

	def gameover_msg
		"Game Over"
	end

	def play 
		puts welcome_msg
		@board.show_board
		while @game_continue == true
			@human.choose_spot(@board, @player1)
			@board.show_board
			puts win_msg(@player1)
			break if @rules.game_over(@board)
			@computer.choose_spot(@board, @player2)
			@board.show_board
			puts win_msg(@player2)
			break if @rules.game_over(@board)
		end
		puts tie_msg
		puts gameover_msg
	end
end	

game = Game.new
game.play

