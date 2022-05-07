class Gameboard
  def initialize
    board = Array.new(8) { |x_idx| Array.new(8) { |y_idx| [x_idx, y_idx] } }
    puts "Gameboard created."
    knight = Knight.new([0,0])
  end
end
