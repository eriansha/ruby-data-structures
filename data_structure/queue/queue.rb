class Queue

  def initialize(*args)
    @queue = args
  end  
  
  def enqueue(element)
    @queue << element
  end  
  
  def dequeue
    @queue.shift
  end  
  
  def empty?
    @queue.empty?
  end  
  
  def to_a
    @queue.to_a
  end
end