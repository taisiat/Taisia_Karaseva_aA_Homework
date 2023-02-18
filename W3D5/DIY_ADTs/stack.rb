class Stack
  def initialize
    @stack = []
  end

  def push(el)
    stack.push(el)
    self
  end

  def pop
    stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    stack.last
  end

  def size
    stack.length
  end

  def empty?
    stack.empty?
  end

  def inspect
    "<>#Stack:#{stack.object_id}"
  end

  private
  attr_reader :stack
end