require_relative 'node'

class SingleLinkedList

  attr_reader :head

  def initialize
    @head = nil
  end

  def read(index)
    current_node = @head
    current_index = 0

    while current_index < index
      return nil if current_node.nil?

      current_node = current_node.next_node
      current_index += 1
    end

    unless current_node
      return nil
    else
      return current_node.data
    end
  end

  def index_of(data)
  end

  def insert(data)
    current_node = @head
    new_node = Node.new(data)

    if current_node.nil?
      @head = new_node
    else
      while current_node.next_node
        current_node = current_node.next_node
      end

      current_node.next_node = new_node
    end
    
  end

  def insert_at(index, data)
    current_node = @head
    current_index = 0
    new_node = Node.new(data)

    if index == 0
      new_node.next_node = @head
      @head = new_node
      return
    end

    # looping through previos node before node index
    while current_index < (index - 1)
      # guard whether index is out of range
      return if current_node.nil?

      current_node = current_node.next_node
      current_index += 1
    end

    # swap the order
    # current node: b
    # new node: x
    #
    # before:  a -> b -> c
    # after:   a -> b -> x -> c
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  def delete_at(index)
    previous_node = nil
    current_node = @head
    current_index = 0

    if index == 0 
      # if the head does not have next node
      # set the head as empty
      # otherwise, assing the next node to be new head
      if current_node.next_node.nil?
        @head = nil
      else
        @head = current_node.next_node
      end
      return current_node
    end

    # prevent next node to be nil
    while current_index < index
      previous_node = current_node
      current_node = current_node.next_node
      current_index += 1
    end
    
    previous_node.next_node = current_node.next_node

    return current_node
  end

end