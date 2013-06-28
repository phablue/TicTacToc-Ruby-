require "human"
require "game_board"

describe Human do
	
	let(:test) {Human.new}
	let(:board) {GameBoard.new}

	it "show choose msg" do
		test.choose_msg.should == test.choose_msg
	end

	it "show err msg" do
		test.err_msg.should == test.err_msg
	end

end



