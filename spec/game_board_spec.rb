require "game_board"

describe "GameBoard" do
	let(:board) {GameBoard.new}

	it "row spots from gameboard" do
		board.spots  = [
						 "1", "2", "3",
						 "4", "5", "6",
						 "7", "8", "9"
				       ]
		board.row_spots.should == [["1", "2", "3"],["4", "5", "6"],["7", "8", "9"]]
	end

	it "column spots from gameboard" do
		board.spots  = [
						 "1", "2", "3",
						 "4", "5", "6",
						 "7", "8", "9"
				       ]
		board.column_spots.should == [["1", "4", "7"],["2", "5", "8"],["3", "6", "9"]]
	end

	it "diagonal spots from gameboard" do
		board.spots  = [
						 "1", "2", "3",
						 "4", "5", "6",
						 "7", "8", "9"
				       ]
		board.diagonal_spots.should == [["1", "5", "9"], ["3", "5", "7"]]
	end

	it "show only numbers from gameboard" do
		board.spots = [
						"1", "X", "3",
						"4", "O", "6",
						"X", "8", "9"
				 	  ]
		board.available_spots.should == ["1", "3", "4", "6", "8", "9"]
	end

	it "places a chosen move" do
		board.spots = [
						"1", "2", "3",
						"4", "5", "6",
						"7", "8", "9"
				 	  ]
		board.mark_choice_spot("2", "X")
		board.spots[1].should == "X"
	end
	
end

