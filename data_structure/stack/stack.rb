class Stack

  def initialize(*args)
    @stack = args
  end

  def push(element)
    @stack << element
  end

  def pop
    @stack.pop
  end

  def empty?
    @stack.empty?
  end

  def to_a
    @stack.to_a
  end

end