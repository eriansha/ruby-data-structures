require_relative '../../data_structure/double_linked_list/double_linked_list'

module BreathFirstSearch

  extend self
  
  def hasPath(source_node, destination_node)
    nextToVisited = Queue.new
    visited = Set.new
    # push the source node to be visited
    nextToVisited.enqueue(source_node)

    while !nextToVisited.empty?
      node = nextToVisited.dequeue
      
      # if the current visited node is destination, return true
      return true if node == destination_node

      # continue if the node has been visited
      next if visited.include?(node)

      # label the node as visited
      visited.add(node)

      # otherwise, add all leaves node to be next to visited
      node.leaves.each do |leaf|
        nextToVisited.enqueue(leaf)
      end
    end
    
    return false
  end

end

class Queue

  def initialize(*args)
    @queue = DoubleLinkedList.new
  end

  def enqueue(element)
    @queue.append(element)
  end

  def dequeue
    deleted_node = @queue.delete_at_beginning

    return deleted_node.value
  end

  def empty?
    @queue.head.nil?
  end
end