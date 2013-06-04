class GameBoard

	attr_accessor :spots

	def initialize
		@spots = [
					"1", "2", "3",
					"4", "5", "6",
					"7", "8", "9"
				 ]
	end

	def row_spots
		return @spots.each_slice(3).to_a
	end

	def show_board
		puts "--------------"
		for index in 0..2
			puts row_spots[index].join("  |  ")
			puts "--------------"
		end
	end

end
