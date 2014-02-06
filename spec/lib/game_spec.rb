require "spec_helper"

describe Game do
  let(:game) {Game.new}
  let(:board) {GameBoard.new}
  before(:each) {
    @user = "X"
    @computer = "O"
    @player = ""
  }

  it "Welcome message" do
    game.should_receive(:puts).with("\nWelcome to TicTacToe !\n\n")
    game.welcome_msg
  end

  context "End of game messages" do
    after(:each) {
      game.should_receive(:gameover_msg)
      game.end_of_game_msg(@player)
    }

    it "for user win" do
      game.should_receive(:puts).with("\nCongratulations~ You win !!")
      game.user_win_msg
    end

    it "for computer win" do
      game.should_receive(:puts).with("\nSorry.. Computer win..")
      game.computer_win_msg
    end

    it "for tie" do
      game.should_receive(:puts).with("\nGame is tie")
      game.tie_msg
    end

    it "for gameover" do
      game.should_receive(:puts).with("Game Over")
      game.gameover_msg
    end

    it "If user win" do
      board.spots  = [
                      "X", "2", "3",
                      "X", "O", "O",
                      "X", "8", "9"
                     ]
      @player = @user
      game.end_of_game_msg(@player).should include{game.user_win_msg}
    end

    it "If computer win" do
      board.spots  = [
                      "X", "X", "3",
                      "O", "O", "O",
                      "X", "8", "9"
                     ]
      @player = @computer
      game.end_of_game_msg(@player).should include{game.computer_win_msg}
    end

    it "If game is tie" do
      board.spots  = [
                      "X", "X", "O",
                      "X", "O", "O",
                      "O", "X", "X"
                     ]
      @player = @user
      game.end_of_game_msg(@player).should include{game.tie_msg}
    end

    it "If game is tie" do
      board.spots  = [
                      "X", "X", "O",
                      "X", "O", "O",
                      "O", "X", "X"
                     ]
      @player = @user
      game.end_of_game_msg(@player).should include{game.tie_msg}
    end
  end

  context "Player change" do
    it "to user if current player is computer" do
      game.change_player(@computer).should == @user
    end

    it "to computer if current player is user" do
      game.change_player(@user).should == @computer
    end
  end

  context "Play first" do
    it "Asking" do
      expect {game.go_first}.to include{game.ask_yes_no}
      game.should_receive(:print).with("\nDo you require the first move? (y/n): ")
      game.ask_yes_no
    end

    it "if answer is yes" do
      answer = "y"
      expect {game.go_first}.to be{@user}
    end

    it "if answer is no" do
      answer = "n"
      expect {game.go_first}.to be{@computer}
    end

    it "if mistake to type" do
      answer = 1
      expect {game.go_first}.to include{"\nYou have to enter 'y' or 'n'\n"}
      game.should_receive(:go_first)
      game.go_first
    end

    context "Playing" do
      it "get welcome message" do
        expect {game.play}.to include{welcome_msg}
      end
      it "call game board" do
        expect {game.play}.to include{@board.show_board}
      end
    end
  end
end
