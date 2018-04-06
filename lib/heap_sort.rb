require_relative "heap"

class Array
  def heap_sort!
    (1...length).each do |i|
      BinaryMinHeap.heapify_up(self, i, length)
    end 

    partition = length - 1
      
    self
  end
end
