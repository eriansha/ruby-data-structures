require_relative 'node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value, node = @root)
    if !root
      @root = Node.new(value)
    elsif value < node.value
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert(value, node.left)
      end
    elsif value > node.value
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert(value, node.right)
      end
    end
  end

  def find(value, node = @root)
    if value < node.value
      find(value, node.left)
    elsif value > node.value
      find(value, node.right)
    elsif value == node.value
      return node
    else
      return nil
    end
  end

  def delete(value, node = @root, parent_node = nil, mark = nil)
    return nil if node.nil?

    if value == node.value
      deleted_node = node
      
      if node == @root
        @root = nil
      else
        # lazy evaluation
        # doing evaluation at the runtime
        if node.left.nil? || node.right.nil?  
          parent_node.send("#{mark}=", node.left || node.right)
        else
          parent_node.send("#{mark}").value = leftmost_node(node.right).value
        end
      end
    elsif value < node.value
      deleted_node = delete(value, node.left, node, 'left')
    elsif value > node.value
      deleted_node = delete(value, node.right, node, 'right')
    end

    return deleted_node
  end

  def leftmost_node(node)
    return node if node.left.nil?
    
    return leftmost_node(node.left)
  end
end
