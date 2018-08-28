require_relative "piece"
require_relative "display"
class Board 
  
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    set_up
  end
  
  def set_up
    (0..7).each do |i|
      if i < 2 || i > 5
        @grid[i].each_with_index { |_el, idx| @grid[i][idx] = Piece.new }
      else
        @grid[i].each_with_index { |_el, idx| @grid[i][idx] = NullPiece.new }
      end 
    end 
  end  
  
  def move_piece(start_pos, end_pos)
    raise StandardError, "Choose a start position that contains a piece." if self[start_pos].is_a?(NullPiece)
    raise StandardError, "You can't move to that position." unless self[end_pos].is_a?(NullPiece)
    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
  end
  
  def valid_pos?(pos) 
    pos.none? { |el| el > 7 || el < 0}
  end 
  
  
  
  
  def [](pos)
    row, col = pos 
    @grid[row][col]
  end 
  
  def []=(pos, value)
    row, col = pos 
    @grid[row][col] = value 
  end 
  
end 

