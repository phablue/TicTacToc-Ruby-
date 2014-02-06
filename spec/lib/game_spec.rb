require "spec_helper"

describe Game do
  let(:game) {Game.new}
  let(:board) {GameBoard.new}

  context "End of game messages" do
    before(:each) {
      @player1 = "X"
      @player2 = "O"
    }
    after(:each) {
      game.should_receive(:gameover_msg)
      game.end_of_game_msg(@player1)
    }

    it "If user win" do
      board.spots  = [
                      "X", "2", "3",
                      "X", "O", "O",
                      "X", "8", "9"
                     ]
      game.end_of_game_msg(@player1).should include{game.user_win_msg}
    end

    it "If computer win" do
      board.spots  = [
                      "X", "X", "3",
                      "O", "O", "O",
                      "X", "8", "9"
                     ]
      game.end_of_game_msg(@player1).should include{game.computer_win_msg}
    end

    it "If game is tie" do
      board.spots  = [
                      "X", "X", "O",
                      "X", "O", "O",
                      "O", "X", "X"
                     ]
      game.end_of_game_msg(@player1).should include{game.tie_msg}
    end

    it "If game is tie" do
      board.spots  = [
                      "X", "X", "O",
                      "X", "O", "O",
                      "O", "X", "X"
                     ]
      game.end_of_game_msg(@player1).should include{game.tie_msg}
    end
  end
end
