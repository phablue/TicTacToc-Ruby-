class GameBoard
  attr_accessor :spots

  def initialize()
    @spots = [
      "1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"
    ]
  end

  def show_board
    for index in 0..2
      puts organize_spots(index).join("  |  ")
      puts "--------------" unless index == 2
    end
  end

  def organize_spots(index)
    row_spots[index].collect do |spot|
      spot = represent(spot)
    end
  end

  def represent(spot)
    spot.to_i == 0 ? spot : " "
  end

  def row_spots
    @spots.each_slice(3).to_a
  end

  def column_spots
    row_spots.transpose
  end

  def diagonal_spots
    diagonal = []
    diagonal << @spots.values_at(0, 4, 8)
    diagonal << @spots.values_at(2, 4, 6)
    diagonal
  end

  def available_spots
    @spots.select {|spot| spot =~ /\d/}
  end

  def mark_choice_spot(chosen_spot, current_player)
    @spots[chosen_spot.to_i-1] = current_player
  end
end
