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

  def check_number(bst)
    lower_numbers = []
    lower_numbers += check_number(bst.left) if bst.left
    lower_numbers << bst.data
    lower_numbers += check_number(bst.right) if bst.right
    lower_numbers
  end

  def each
    return to_enum(:each) unless block_given?
    check_number(self).each { |num| yield num }
  end
end