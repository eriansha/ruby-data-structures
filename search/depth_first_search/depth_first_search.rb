require_relative '../../data_structure/stack/stack'

module DepthFirstSearch

  extend self

  ##
  # DFS with recursive func
  #
  def hasPath(source_node, destination_node)
    visited = []
    result, visited = search(source_node, destination_node, visited)

    return result
  end

  ##
  # DFS with Stack
  def hasPath(source_node, destination_node)
    visited = []
    s = Stack.new

    s.push(source_node)

    while !s.empty?
      current_node = s.pop

      if current_node == destination_node
        # keep track the node if the destination found
        visited << current_node
        return true
      end

      # if the node hasn't visited yet, ask the adjacent
      unless visited.include?(current_node)
        current_node.leaves.each { |node| s.push(node) }
        visited << current_node
      end

    end
  
    return false
  end

  private 

  def search(source_node, destination_node, visited)
    # mark source node as visited node
    visited << source_node

    return true if source_node == destination_node

    source_node.leaves.each do |node|
      # if the node hasn't visited yet, search the node
      unless visited.include?(node)
        return true, visited if search(node, destination_node, visited)
      end
    end

    return false
  end
end