require "Computer"
require "GameBoard"

describe Computer do 
	
	let(:test) {Computer.new}
	let(:board) {GameBoard.new}

	it "changed_player = X when current_player = O " do
		test.change_player("O").should == "X"
	end

	it "changed_player = O when current_player = X " do
		test.change_player("X").should == "O"
	end

	it "choose easy win" do
		board.spots = [
						"X", "X", "3",
						"4", "X", "6",
						"O", "O", "9"
				 	  ]
		test.minimax(board, "O").last.should == "9"
	end

	it "choose block" do
		board.spots = [
						"X", "O", "3",
						"O", "5", "6",
						"X", "8", "X"
				 	  ]
		test.minimax(board, "O").last.should == "8"
	end

end
