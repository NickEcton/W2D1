require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  
  def initialize
    @board = Board.new 
    @cursor = Cursor.new([0,0], @board)
  end 
  
  def render
    Board.grid.each_with_index do |el1, idx1| 
      el1.each_with_index do |el2, idx2|
        if idx2 <= idx1 
          next 
        end  
        print @board[idx1][idx2].colorize(:blue)
      end 
      puts "\n"
    end 
        
    @cursor.cursor_pos.colorize(:red)
  end 
  
end 