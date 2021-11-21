require_relative 'node'

class DoubleLinkedList

  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  ##
  # read particular node data
  # @param {number} index - Index
  # @return {any} Node data
  def read(index)
    # traverse from the head
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

  def empty?
    @head.nil?
  end

  def index_of; end

  ##
  # print the order nodes (forward and backward)
  # @param {string} order node
  def print
    printed_forward = ''
    printed_backward = ''
    current_node = @head
    
    while current_node
      printed_forward += "#{current_node.data} ->"
      current_node = current_node.next_node
    end

    current_node = @tail
    while current_node
      printed_backward = printed_backward + "<- #{current_node.data}"
      current_node = current_node.previous_node
    end

    puts "forward: #{printed_forward}"
    puts "backward: #{printed_backward}"
  end

  ##
  # Append new node to the last index
  # ! duplicated code: it similar to insert_at_end
  # @param {any} data - Node data
  def append(data)
    new_node = Node.new(data)
    
    unless @head
      @head = new_node
      @tail = new_node
    else
      new_node.previous_node = @tail
      @tail.next_node = new_node

      @tail = new_node
    end
  end

  ##
  # insert new node at the beginning of the list
  # @param {any} data - Node data
  def insert_at_beginning(data) 
    new_node = Node.new(data)
    # assign the new node attributes
    # next node become the current head
    # previous node still empty since we insert at the beginning
    new_node.next_node = @head
    new_node.previous_node = nil

    # assign new node as tail if head is nill
    # node is able to become head and tail at the same time
    if @head.nil?
      @tail = new_node
    else
      @head.previous_node = new_node
    end

    # assign the new node into head
    @head = new_node
  end
  
  ##
  # insert new node at the end of the list
  # @param {any} data - Node data
  def insert_at_end(data)
    new_node = Node.new(data)
    # assign the new node attributes
    # next node become empty since we insert at the end
    # previous node become the current tail
    new_node.previous_node = @tail
    new_node.next_node = nil

    # assign new node as tail if head is nill
    # node is able to become head and tail at the same time
    if @tail.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end

    # assign the new node into tail
    @tail = new_node
  end

  ##
  # TODO: WIP
  # insert new node at any given index
  # @param {number} index - Index node
  # @param {any} data - Node data
  def insert_at(index, data)
    new_node = Node.new(data)
    current_node = @head
    current_index = 0

    if (index == 0)
      self.insert_at_beginning(data)
      return
    end

    # traverse from the beginning
    # we could optimize to start traverse by looking the nearest index between head and tail
    while current_index < index - 1
      return if current_node.nil?

      current_node = current_node.next_node
      current_index += index
    end

    ##
    # current list: a <-> b
    # new node: x (index 1)
    # 1. x -> b
    # 2. a <- x
    # 3. a -> x
    # 4. x <- b

    # new_node.next_node = current_node
    # new_node.previous_node = current_node.previous_node

    # current_node.previous_node.next_node = new_node
    # current_node.previous_node = new_node

    # TODO: TAIL IS NOT UPDATED
    after_node = current_node.next_node

    new_node.next_node = after_node
    after_node.previous_node = new_node unless after_node.nil?
    new_node.previous_node = current_node
    current_node.next_node = new_node
  end

  ##
  # delete at the beginning node
  # @return {Node} deleted node
  def delete_at_beginning
    deleted_node = @head
    new_head_node = @head.next_node

    @tail = nil if new_head_node.nil?
    
    @head = new_head_node
    return deleted_node
  end

  ##
  # delete at the end of node
  # @return {Node} deleted node
  def delete_at_end 
    deleted_node = @tail
    new_tail_node = @tail.previous_node

    @tail = new_tail_node
    return deleted_node
  end
end
