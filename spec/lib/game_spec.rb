require "spec_helper"
require "stringio"

describe Game do
  before(:each) {
    @user = "X"
    @computer = "O"
  }

  context "Show" do
    before(:each) {
      @output = StringIO.new 
      @writer = Writer.new(@output)
      @game = Game.new(nil, @writer)
    }

    it "a welcome message" do
      @writer.should_receive(:print_out).with(@game.welcome_msg)
      @game.show_msg(@game.welcome_msg)
    end

    it "a win message for user" do
      @writer.should_receive(:print_out).with(@game.user_win_msg)
      @game.show_msg(@game.user_win_msg)
    end

    it "a win message for computer" do
      @writer.should_receive(:print_out).with(@game.computer_win_msg)
      @game.show_msg(@game.computer_win_msg)
    end

    it "a tie message" do
      @writer.should_receive(:print_out).with(@game.tie_msg)
      @game.show_msg(@game.tie_msg)
    end

    it "a gameover message" do
      @writer.should_receive(:print_out).with(@game.gameover_msg)
      @game.show_msg(@game.gameover_msg)
    end

    it "a asking message" do
      @writer.should_receive(:print_out).with(@game.ask_yes_no)
      @game.show_msg(@game.ask_yes_no)
    end

    it "a error message" do
      @writer.should_receive(:print_out).with(@game.err_msg)
      @game.show_msg(@game.err_msg)
    end

    context "End of game messages." do
      it "Show user win message if user win" do
        @game.board.spots = [
                              "X", "2", "3",
                              "X", "O", "O",
                              "X", "8", "9"
                            ]
        @game.should_receive(:show_msg).with(@game.user_win_msg)
        @game.end_of_game_msg(@user)
      end

      xit "Show computer win message If computer win" do
        @game.board.spots = [
                              "O", "X", "3",
                              "O", "X", "X",
                              "O", "8", "9"
                            ]
        @game.should_receive(:show_msg).with(@game.computer_win_msg)
        @game.end_of_game_msg(@computer)
      end

      it "Show tie message if game tie" do
        @game.board.spots = [
                              "X", "O", "X",
                              "X", "O", "O",
                              "O", "X", "X"
                            ]
        @game.should_receive(:show_msg).with(@game.tie_msg)
        @game.end_of_game_msg(@user)
      end
    end
  end

  context "Player change" do
    before(:each) {
      @game = Game.new(nil, nil)
    }    
    it "to user if current player is computer" do
      @game.change_player(@computer).should == @user
    end

    xit "to computer if current player is user" do
      @game.change_player(@user).should == @computer
    end
  end

  # context "Play first" do
  #   it "Asking" do
  #     expect {game.go_first}.to include{game.ask_yes_no}
  #     game.should_receive(:print).with("\nDo you require the first move? (y/n): ")
  #     game.ask_yes_no
  #   end

  #   it "if answer is yes" do
  #     answer = "y"
  #     expect {game.go_first}.to be{@user}
  #   end

  #   it "if answer is no" do
  #     answer = "n"
  #     expect {game.go_first}.to be{@computer}
  #   end

  #   it "if mistake to type" do
  #     answer = 1
  #     expect {game.go_first}.to include{"\nYou have to enter 'y' or 'n'\n"}
  #     game.should_receive(:go_first)
  #     game.go_first
  #   end

  #   context "Playing" do
  #     it "get welcome message" do
  #       expect {game.play}.to include{welcome_msg}
  #     end
  #     it "call game board" do
  #       expect {game.play}.to include{@board.show_board}
  #     end
  #   end
  # end
end
