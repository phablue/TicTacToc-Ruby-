require "GamePlay"
require "GameBoard"

describe GamePlay do
	
	let(:test) {GamePlay.new}
	let(:board) {GameBoard.new}

	it "check when 'X' retun player1" do
		test.current_player("X").should == "player1"
	end

	it "check when 'O' retun player2" do
		test.current_player("O").should == "player2"
	end

	it "when 'X' check include player1 in msg" do
		test.choose_msg("X").should == "[player1] Enter a number of your choice : "
	end

	it "when 'O' check include player2 in msg" do
		test.choose_msg("O").should == "[player2] Enter a number of your choice : "
	end

	it "check 1 include board" do
		board.spots = [
						"O", "2", "3",
						"O", "O", "O",
						"7", "8", "9"
				 	  ]
		test.available_spot("1",board).should == false
	end

	it "check 2 include board" do
		board.spots = [
						"O", "2", "3",
						"O", "O", "O",
						"7", "8", "9"
				 	  ]
		test.available_spot("2",board).should == true
	end

	it "show err msg" do
		test.err_msg.should == test.err_msg
	end

end



