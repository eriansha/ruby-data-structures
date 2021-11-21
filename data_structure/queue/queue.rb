require_relative '../double_linked_list/double_linked_list'

# class Queue

#   def initialize(*args)
#     @queue = args
#   end

#   def enqueue(element)
#     @queue << element
#   end

#   def dequeue
#     @queue.shift
#   end

#   def empty?
#     @queue.empty?
#   end

#   def to_a
#     @queue.to_a
#   end
# end

# implemenet linked list in Queue concept
# to get most optimize result, we're using double linked list
# so we could get O(1) when doing enqueue (insert at the end node)
class Queue

  def initialize(*args)
    @queue = DoubleLinkedList.new

    args.each { |data| @queue.append(data) }
  end

  def enqueue(element)
    @queue.append(element)
  end

  def dequeue
    deleted_node = @queue.delete_at_beginning

    return deleted_node.data
  end

  def empty?
    @queue.head.nil?
  end

  def to_a
    arr = []
    current_node = @queue.head

    while current_node
      arr << current_node.data
      current_node = current_node.next_node
    end

    return arr
  end
end