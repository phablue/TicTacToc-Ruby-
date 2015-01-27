require "spec_helper"
require "stringio"

describe Human do
  let(:board) {GameBoard.new}

  context "Check the user input validation : " do
    before(:each) {
      @output = StringIO.new
      @writer = Writer.new(@output)
      @human = Human.new(nil, @writer)
      board.spots  = [
                       "1", "X", "3",
                       "4", "X", "6",
                       "O", "O", "9"
                      ]
      @user = "X"
      @answer = "2"
    }

    it "When the input is invalid, show error message" do
      @human.should_receive(:unavailable_spot).and_return(@human.error_message)
      @human.check_available(board, @user, @answer)
    end

    it "When the input is invalid, call choose_spot method" do
      @human.should_receive(:choose_spot)
      @human.check_available(board, @user, @answer)
    end

    it "When the input is valid, mark a chosen spot" do
      @answer = "1"
      expect {@human.check_available(board, @user, @answer)}.to change {board.spots[0]}.to("X")
    end
  end

  context "Show message" do
    before(:each) {
      @output = StringIO.new
      @writer = Writer.new(@output)
      @human = Human.new(nil, @writer)
    }

    it "when user turn" do
      @writer.should_receive(:print_out).with(@human.move_msg)
      @human.ask_move
    end

    it "when raise error" do
      @writer.should_receive(:print_out).with(@human.error_message)
      @human.raise_error
    end
  end

  it "Gets user input" do
    @input = StringIO.new "1"
    @reader = Reader.new(@input)
    @human = Human.new(@reader, nil)
    @human.user_input.should == "1"
  end
end
