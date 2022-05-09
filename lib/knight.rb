require "./lib/tree.rb"
class Knight

  attr_accessor :moves
  def initialize(curr_pos)
    @moves = Tree.new(curr_pos)
    puts "Knight created."
    knight_moves(@moves.data, [4,3])

  end
  # knight_moves will use BFS algorithm because we want the least moves possible
  # to reach a destination.
  # DFS algorithm would go deep in a tree to reach a destination.
  def knight_moves(curr_pos, dest, visit_q=[])
    # byebug
    # base case
    if curr_pos == dest
      return curr_pos
    else
      curr_x = curr_pos[0]
      curr_y = curr_pos[1]
      pos_x1 = curr_x + 1
      pos_x2 = curr_x + 2
      neg_x1 = curr_x - 1
      neg_x2 = curr_x - 2
      pos_y1 = curr_y + 1
      pos_y2 = curr_y + 2
      neg_y1 = curr_y - 1
      neg_y2 = curr_y - 2

      # get all legal positions the knight can take on and make that a child in the tree
      if curr_x - 2 >= 0 && curr_y + 1 <= 7
        @moves.child.push(Tree.new([neg_x2, pos_y1]))
        # queue.push([neg_x2, pos_y1])
      end
      if curr_x - 1 >= 0 && curr_y + 2 <= 7
        @moves.child.push(Tree.new([neg_x1, pos_y2]))
        # queue.push([neg_x1, pos_y2])
      end
      if curr_x + 2 <= 7 && curr_y + 1 <= 7
        @moves.child.push(Tree.new([pos_x2, pos_y1]))
        # queue.push([pos_x2, pos_y1])
      end
      if curr_x + 1 <= 7 && curr_y + 2 <= 7
        @moves.child.push(Tree.new([pos_x1, pos_y2]))
        # queue.push([pos_x1, pos_y2])
      end
      if curr_x - 2 >= 0 && curr_y - 1 >= 0
        @moves.child.push(Tree.new([neg_x2, neg_y1]))
        # queue.push([neg_x2, neg_y1])
      end
      if curr_x - 1 >= 0 && curr_y - 2 >= 0
        @moves.child.push(Tree.new([neg_x1, neg_y2]))
        # queue.push([neg_x1, neg_y2])
      end
      if curr_x + 2 <= 7 && curr_y - 1 >= 0
        @moves.child.push(Tree.new([pos_x2, neg_y1]))
        # queue.push([pos_x2, neg_y1])
      end
      if curr_x + 1 <= 7 && curr_y - 2 >= 0
        @moves.child.push(Tree.new([pos_x1, neg_y2]))
        # queue.push([pos_x1, neg_y2])
      end
      # add moves' unvisited children to queue until there are no more
      @moves.child.each do |child|
        # byebug
        child.parent = @moves
        if child.data == dest
          path = []
          until child.nil? do
            # byebug
            # puts "#{child.data}" unless child.data.nil?
            path.push(child.data)
            child = child.parent
          end
          puts "You made it in #{path.length - 1} moves! Here's your path: "
          # byebug
          path.reverse.each { |pos| p pos }
          return
        else
          
          visit_q.push(child)
        end
      end
    end
      # dequeue child and set that as moves

      @moves = visit_q.shift
      # recurse with new curr_pos
      knight_moves(@moves.data, dest, visit_q)
  end
end