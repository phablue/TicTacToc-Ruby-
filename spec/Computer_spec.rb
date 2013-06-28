require "computer"
require "game_board"

describe Computer do 
	
	let(:test) {Computer.new}
	let(:board) {GameBoard.new}

	it "changed_player = X when current_player = O " do
		test.change_player("O").should == "X"
	end

	it "changed_player = O when current_player = X " do
		test.change_player("X").should == "O"
	end

	it "choose easy win in a row" do
		board.spots = [
						"X", "X", "3",
						"4", "X", "6",
						"O", "O", "9"
				 	  ]
		test.minimax(board, "O").last.should == "9"
	end

	it "choose easy win in a column" do
		board.spots = [
						"O", "2", "3",
						"4", "X", "6",
						"O", "X", "X"
				 	  ]
		test.minimax(board, "O").last.should == "4"
	end

	it "choose easy win in a diagonal" do
		board.spots = [
						"X", "X", "O",
						"4", "O", "6",
						"7", "8", "X"
				 	  ]
		test.minimax(board, "O").last.should == "7"
	end

	it "choose block in a row" do
		board.spots = [
						"X", "O", "3",
						"O", "5", "6",
						"X", "8", "X"
				 	  ]
		test.minimax(board, "O").last.should == "8"
	end

	it "choose block in a column" do
		board.spots = [
						"X", "O", "3",
						"4", "5", "6",
						"X", "8", "9"
				 	  ]
		test.minimax(board, "O").last.should == "4"
	end

	it "choose block in a diagonal" do
		board.spots = [
						"X", "O", "X",
						"O", "5", "6",
						"X", "8", "9"
				 	  ]
		test.minimax(board, "O").last.should == "5"
	end
end
