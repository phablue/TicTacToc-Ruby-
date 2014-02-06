require "spec_helper"

describe Computer do
	let(:computer) {Computer.new}
	let(:board) {GameBoard.new}

	it "changed_player = X when current_player = O " do
		computer.change_player("O").should == "X"
	end

	it "changed_player = O when current_player = X " do
		computer.change_player("X").should == "O"
	end

	it "choose easy win in a row" do
		board.spots = [
									 "X", "X", "3",
									 "4", "X", "6",
									 "O", "O", "9"
									 ]
		computer.minimax(board, "O").last.should == "9"
	end

	it "choose easy win in a column" do
		board.spots = [
									 "O", "2", "3",
									 "4", "X", "6",
									 "O", "X", "X"
									 ]
		computer.minimax(board, "O").last.should == "4"
	end

	it "choose easy win in a diagonal" do
		board.spots = [
									 "X", "X", "O",
									 "4", "O", "6",
									 "7", "8", "X"
									 ]
		computer.minimax(board, "O").last.should == "7"
	end

	it "choose block in a row" do
		board.spots = [
									 "X", "O", "3",
									 "O", "5", "6",
									 "X", "8", "X"
									 ]
		computer.minimax(board, "O").last.should == "8"
	end

	it "choose block in a column" do
		board.spots = [
									 "X", "O", "3",
									 "4", "5", "6",
									 "X", "8", "9"
									]
		computer.minimax(board, "O").last.should == "4"
	end

	it "choose block in a diagonal" do
		board.spots = [
									 "X", "O", "X",
									 "O", "5", "6",
									 "X", "8", "9"
									 ]
		computer.minimax(board, "O").last.should == "5"
	end

	context "Computer choose the best spot" do
		before(:each) {
			board.spots = [
										 "X", "O", "X",
										 "O", "5", "6",
										 "X", "8", "9"
										 ]
		}
		it "show message" do
			computer.should_receive(:puts).with("Please wait to computer play..")
			computer.choose_spot(board, "O")
		end

		it "mark" do
			computer.choose_spot(board, "O").should == board.spots[4]
			board.spots[4].should == "O"
		end
	end

end
