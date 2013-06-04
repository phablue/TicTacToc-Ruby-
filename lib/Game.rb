require_relative "GameBoard"
require_relative "GameRules"
require_relative "GamePlay"

class Game

	def initialize
		@player1 = "X"
		@player2 = "O"
		@game_continue = true
		@board = GameBoard.new
		@rules = GameRules.new
		@play = GamePlay.new	
	end

	def welcome_msg
		"Welcome to TicTacToe !"
	end

	def win_msg
		"Congratulations.. You win!!"
	end

	def play 
		welcome_msg
		@board.show_board
			while @game_continue = true
				@play.apply_choice_spot(@player1,@board)
				@board.show_board
				break if @rules.win_requirement_total(@board) == true
				@play.apply_choice_spot(@player2,@board)
				@board.show_board
				break if @rules.win_requirement_total(@board) == true
			end		
		puts win_msg
	end
end	

game = Game.new
game.play





