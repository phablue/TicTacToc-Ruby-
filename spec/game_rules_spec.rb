require "game_rules"
require "game_board"

describe GameRules do 
	
	let(:test) {GameRules.new}
	let(:board) {GameBoard.new}
	
	it "checks row win"  do
		board.spots = [
						"1", "2", "3",
						"4", "5", "6",
						"X", "X", "X"
				 	  ]
		test.win_requirement_row(board).should == true
	end

	it "checks row win"  do
		board.spots = [
						"1", "2", "3",
						"O", "O", "O",
						"7", "8", "9"
				 	  ]
		test.win_requirement_row(board).should == true
	end

	it "checks column win" do
		board.spots = [
						"X", "2", "3",
						"X", "5", "6",
						"X", "8", "9"
				 	  ]
		test.win_requirement_column(board).should == true
	end

	it "checks column win" do
		board.spots = [
						"1", "2", "O",
						"4", "5", "O",
						"7", "8", "O"
				 	  ]
		test.win_requirement_column(board).should == true
	end

	it "checks diagonal win" do
		board.spots = [
						"1", "2", "X",
						"4", "X", "6",
						"X", "8", "9"
				 	  ]
		test.win_requirement_diagonal(board).should == true
	end

	it "checks diagonal win" do
		board.spots = [
						"O", "2", "3",
						"4", "O", "6",
						"7", "8", "O"
				 	  ]
		test.win_requirement_diagonal(board).should == true
	end

	it "checks win" do
		board.spots = [
						"O", "X", "X",
						"4", "O", "X",
						"O", "8", "X"
					  ]
		test.game_win(board).should == true
	end

	it "checks tie" do
		board.spots = [
						"O", "X", "O",
						"X", "O", "X",
						"X", "O", "X"
					  ]
		test.game_tie(board).should == true
	end

	it "checks game over when game is tie" do
		board.spots = [
						"X", "O", "X",
						"O", "X", "O",
						"O", "X", "X"
					  ]
		test.game_over(board).should == true
	end

	it "checks game over when game is win" do
		board.spots = [
						"X", "O", "X",
						"4", "O", "X",
						"7", "O", "9"
					  ]
		test.game_over(board).should == true
	end

end

