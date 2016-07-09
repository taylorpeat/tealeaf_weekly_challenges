class Bst
  attr_accessor :data, :left, :right

  def initialize(num)
    @data = num
  end

  def insert(new_num)
    assign_number(self, new_num)
  end

  def assign_number(tree, new_num)
    if new_num > tree.data
      tree.right ? assign_number(tree.right, new_num) : (tree.right = Bst.new new_num)
    else
      tree.left ? assign_number(tree.left, new_num) : (tree.left = Bst.new new_num)
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