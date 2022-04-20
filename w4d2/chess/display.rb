require "colorize"
require_relative "cursor.rb"
class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end
  def render
    (0..7).each_with_index do |row, i|
      print_row = (0..7).map.with_index do |col, j| 
        (i + j) % 2 == 0 ? @board[[row,col]].to_s.on_red : @board[[row,col]].to_s.on_blue
      end
      puts print_row.join("")
    end
  end



end