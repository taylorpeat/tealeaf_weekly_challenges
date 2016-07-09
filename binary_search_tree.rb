class Bst
  attr_accessor :data, :left, :right

  def initialize(num)
    @data = num
  end

  def insert(new_num, tree=self)
    if new_num > tree.data
      tree.right ? insert(new_num, tree.right) : (tree.right = Bst.new new_num)
    else
      tree.left ? insert(new_num, tree.left) : (tree.left = Bst.new new_num)
    end
  end

  def each
    return to_enum(:each) unless block_given?
    find_tree_numbers(self).each { |num| yield num }
  end

  def find_tree_numbers(bst)
    tree_numbers = []
    tree_numbers += find_tree_numbers(bst.left) if bst.left
    tree_numbers << bst.data
    tree_numbers += find_tree_numbers(bst.right) if bst.right
    tree_numbers
  end
end