require "GameRules"
require "GameBoard"

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
		test.win_requirement_total(board).should == true
	end

end
