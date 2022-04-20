require "colorize"
require_relative "cursor.rb"
class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end
  def render
    (0..7).each do |row|
      puts (0..7).map{|col| @board[[row,col]].symbol.to_s}.join(" ")
    end
  end

end