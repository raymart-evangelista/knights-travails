require "pry-byebug"

# https://stackoverflow.com/questions/7196430/implementing-tree-with-ruby
class Tree
  attr_accessor :child, :data

  def initialize(data)
    @data = data
    @child = []
    @parent = nil
  end
end
t = Tree.new([3,4])
t.child.push(Tree.new([3,5]))
t.child << Tree.new([4,5])
t.child << Tree.new([6,6])
t.child << Tree.new([7,7,])
p t.child

