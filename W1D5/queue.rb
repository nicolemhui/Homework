class Queue
  attr_reader :stack

  def initialize(stack = [])
    @stack = stack
  end

  def enqueue(el)
    @stack << el
  end

  def dequeue
    @stack.shift
  end

  def peek
    @stack.first
  end
  
end
