require "./lib/tree.rb"
class Knight
  def initialize(curr_pos)
    @moves = Tree.new(curr_pos)
    knight_moves(@moves.data, [1,2])
    puts "Knight created."
  end

  # knight_moves will use BFS algorithm because we want the least moves possible
  # to reach a destination.
  # DFS algorithm would go deep in a tree to reach a destination.
  def knight_moves(curr_pos, dest)
    # knight basic move is two steps forward and one step to side
    # suppose knight starts at [3,3]
    queue = []
    path = []
    moves = Tree.new(curr_pos)
    

    # push current position of knight into queue
    queue.push(moves.data)
    # keep searching for path until we reach destination
    until curr_pos == dest do
      curr_pos = queue[0]
      curr_x = curr_pos[0]
      curr_y = curr_pos[1]

      neg_x1 = curr_x - 1
      neg_x2 = curr_x - 2
      pos_x1 = curr_x + 1
      pos_x2 = curr_x + 2

      neg_y1 = curr_y - 1
      neg_y2 = curr_y - 2
      pos_y1 = curr_y + 1
      pos_y2 = curr_y + 2

      path.push(curr_pos)

      
      if curr_x - 2 >= 0 && curr_y + 1 <= 7
        moves.child.push(Tree.new([neg_x2, pos_y1]))
        queue.push([neg_x2, pos_y1])
      end
      if curr_x - 1 >= 0 && curr_y + 2 <= 7
        moves.child.push(Tree.new([neg_x1, pos_y2]))
        queue.push([neg_x1, pos_y2])
      end
      if curr_x + 2 <= 7 && curr_y + 1 <= 7
        moves.child.push(Tree.new([pos_x2, pos_y1]))
        queue.push([pos_x2, pos_y1])
      end
      if curr_x + 1 <= 7 && curr_y + 2 <= 7
        moves.child.push(Tree.new([pos_x1, pos_y2]))
        queue.push([pos_x1, pos_y2])
      end
      if curr_x - 2 >= 0 && curr_y - 1 >= 0
        moves.child.push(Tree.new([neg_x2, neg_y1]))
        queue.push([neg_x2, neg_y1])
      end
      if curr_x - 1 >= 0 && curr_y - 2 >= 0
        moves.child.push(Tree.new([neg_x1, neg_y2]))
        queue.push([neg_x1, neg_y2])
      end
      if curr_x + 2 <= 7 && curr_y - 1 >= 0
        moves.child.push(Tree.new([pos_x2, neg_y1]))
        queue.push([pos_x2, neg_y1])
      end
      if curr_x + 1 <= 7 && curr_y - 2 >= 0
        moves.child.push(Tree.new([pos_x1, neg_y2]))
        queue.push([pos_x1, neg_y2])
      end
      byebug
      moves = moves.child
      queue.shift
    end


    # # top left quadrant
    # moves.child.push([neg_x2, pos_y1])
    # moves.child.push([neg_x1, pos_y2])
    # # top right quadrant
    # moves.child.push([pos_x2, pos_y1])
    # moves.child.push([curr_x+1, pos_y2])
    # # bottom left quadrant
    # moves.child.push([neg_x2, neg_y1])
    # moves.child.push([neg_x1, neg_y2])
    # # bottom right quadrant
    # moves.child.push([pos_x2, neg_y1])
    # moves.child.push([curr_x+1, neg_y2])

    p path
    # base case, move is off the board
    # return nil if curr_x - 2 < 0 || curr_x + 2 > 7 || curr_y - 2 < 0 || curr_y + 2 > 7
  end
end