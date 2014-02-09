require_relative "game"
require_relative "reader"
require_relative "writer"

game = Game.new(Reader.new, Writer.new)
game.play