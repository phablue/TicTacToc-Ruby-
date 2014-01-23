require "spec_helper"

describe Human do
	let(:board) {GameBoard.new}
	let(:human) {Human.new}

	context "Show message" do
		it "when user turn" do
			human.should_receive(:puts).with("Enter a number of your choice : ")
			human.choose_msg
		end
		
		it "when raise error" do
			human.should_receive(:puts).with("That is not an available number. Please choose a different number.")
			human.err_msg
		end
	end

	context "User choose a spot" do
		before(:each) { 
			board.spots  = [
							 "1", "X", "3",
							 "4", "X", "6",
							 "O", "O", "9"
							]
			@user = "X"
		}
		it "show message" do
			human.stub(:gets) { "1" }
			human.should_receive(:choose_msg) {"Enter a number of your choice : "}
			human.choose_spot(board, @user)
		end

		it "mark" do
			human.stub(:gets) { "1" }
			human.choose_spot(board, @user).should == board.spots[0]
			board.spots[0].should == "X"
		end

		it "if including invalid spots" do
			human.stub(:gets) { "2" }
			human.should_receive(:err_msg) {"That is not an available number. Please choose a different number."}
			human.should_receive(:choose_spot)
			human.unavailable_spot(board, @user)
		end

		it "is invalid" do
			human.stub(:gets) { "2" }
			human.should_receive(:unavailable_spot)
			human.choose_spot(board, @user)
		end
	end
end