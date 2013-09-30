require 'debugger'

class BinaryTreeNode
  attr_accessor :value, :left, :right, :parent

  def initialize(value = nil, left, right, parent)
    @value = value
    @left = left
    @right = right
    @parent = parent
  end

  # def to_s
  #   value
  # end

end

class BinaryTree

  def initialize(root_node)
    @root_node = root_node
  end

  def insert(value, current_node = @root_node)
    if value < current_node.value
      return current_node.left = BinaryTreeNode.new(value,nil,nil,current_node) if current_node.left.nil?
      return insert(value, current_node.left)
    else
      return current_node.right = BinaryTreeNode.new(value, nil, nil, current_node) if current_node.right.nil?
      return insert(value, current_node.right)
    end
  end

  def search(value, current_node = @root_node)
    return nil if current_node.nil?
    if value == current_node.value
      return current_node
    elsif value < current_node.value
      search(value, current_node.left)
    else
      search(value, current_node.right)
    end
  end

  def minimum(current_node = @root_node)
    until current_node.left.nil?
      current_node = current_node.left
    end
    current_node
  end

  def maximum(current_node = @root_node)
    until current_node.right.nil?
      current_node = current_node.right
    end
    current_node
  end

  def predecessor(value)
    node = search(value)
    if node.left
      return maximum(node.left)
    else
      ancestor = node.parent
      return nil if ancestor.nil?
      until ancestor.value < value
        ancestor = ancestor.parent
      end
      return ancestor
    end
  end

  def successor(value)
    node = search(value)
    if node.right
      return minimum(node.right)
    else
      ancestor = node.parent
      return nil if ancestor.nil?
      until ancestor.value > value
        ancestor = ancestor.parent
      end
      return ancestor
    end
  end

  def delete(value)
    node = search(value)
    if node.left.nil? && node.right.nil?
      node.parent.left = nil if node.parent.left == node
      node.parent.right = nil if node.parent.right == node
    elsif node.left.nil?
      @root_node = node.right and return if node.parent.nil?
      node.parent.right = node.right if node.parent.right == node
      node.parent.left = node.right if node.parent.left == node
    elsif node.right.nil?
      @root_node = node.left and return if node.parent.nil?
      node.parent.right = node.left if node.parent.right == node
      node.parent.left = node.left if node.parent.left == node
    else
      to_swap = predecessor(value)
      node.value, to_swap.value = to_swap.value, node.value
      to_swap.parent.left = nil if to_swap.parent.left == to_swap
      to_swap.parent.right = nil if to_swap.parent.left == to_swap
    end
  end

  def as_sorted_array(current_node = @root_node)
    output = []
    unless current_node.nil?
      output << as_sorted_array(current_node.left)
      output << current_node.value
      output << as_sorted_array(current_node.right)
    end
    output.flatten
  end

end

root_node = BinaryTreeNode.new(1, nil, nil, nil)
bst = BinaryTree.new(root_node)
p bst.search(1).value == 1
p bst.search(2) == nil
bst.insert(2)
p bst.search(2).value == 2
bst.insert(3)
bst.insert(4)
bst.insert(5)

p bst.maximum.value == 5
p bst.minimum.value == 1

bst.delete(5)
p bst.maximum.value == 4

bst.delete(1)
p bst.minimum.value == 2

bst.insert(1)
bst.insert(5)

p bst.as_sorted_array == [1,2,3,4,5]

