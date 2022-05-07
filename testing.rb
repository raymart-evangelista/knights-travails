def knight_moves(curr_pos, dest, visit_q=[])
  # base case
  if curr_pos == dest
    return curr_pos
  else
    # get all legal positions the knight can take on and make that a child in the tree
    if curr_x - 2 >= 0 && curr_y + 1 <= 7
      moves.child.push(Tree.new([neg_x2, pos_y1]))
      # queue.push([neg_x2, pos_y1])
    end
    if curr_x - 1 >= 0 && curr_y + 2 <= 7
      moves.child.push(Tree.new([neg_x1, pos_y2]))
      # queue.push([neg_x1, pos_y2])
    end
    if curr_x + 2 <= 7 && curr_y + 1 <= 7
      moves.child.push(Tree.new([pos_x2, pos_y1]))
      # queue.push([pos_x2, pos_y1])
    end
    if curr_x + 1 <= 7 && curr_y + 2 <= 7
      moves.child.push(Tree.new([pos_x1, pos_y2]))
      # queue.push([pos_x1, pos_y2])
    end
    if curr_x - 2 >= 0 && curr_y - 1 >= 0
      moves.child.push(Tree.new([neg_x2, neg_y1]))
      # queue.push([neg_x2, neg_y1])
    end
    if curr_x - 1 >= 0 && curr_y - 2 >= 0
      moves.child.push(Tree.new([neg_x1, neg_y2]))
      # queue.push([neg_x1, neg_y2])
    end
    if curr_x + 2 <= 7 && curr_y - 1 >= 0
      moves.child.push(Tree.new([pos_x2, neg_y1]))
      # queue.push([pos_x2, neg_y1])
    end
    if curr_x + 1 <= 7 && curr_y - 2 >= 0
      moves.child.push(Tree.new([pos_x1, neg_y2]))
      # queue.push([pos_x1, neg_y2])
    end
    # add moves' unvisited children to queue until there are no more
    @moves.child.each do |child|
      visit_q.push(child)
    end

end