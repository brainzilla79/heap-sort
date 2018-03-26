require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new { |a, b| a <=> b }
    @store = []
  end

  def count
    @store.count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    left_index = (2 * parent_index) + 1
    right_index = (2 * parent_index) + 2
    [left_index, right_index].select { |index| index < len }
  end

  def self.parent_index(child_index)
    ((child_index - 1) / 2) >= 0 ? (child_index - 1) / 2 : raise("root has no parent")
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    curr_index = parent_idx
    while curr_index < len 
      child_indices = child_indices(len, curr_index)
      return array if child_indices.empty? 

      if child_indices.length == 1
        swap_index = child_indices[0]
      else 
        left_idx, right_idx = child_indices
        swap_index = prc.call(array[left_idx], array[right_idx]) == -1 ? left_idx : right_idx
      end 

      if prc.call(array[curr_index], array[swap_index]) == 1
        array[curr_index], array[swap_index] = array[swap_index], array[curr_index]
        curr_index = swap_index
      end
      return array if parent_idx == curr_index
    end 
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    curr_index = child_idx
    while curr_index > 0 
      parent_idx = parent_index(curr_index)
      if prc.call(array[curr_index], array[parent_idx]) == -1
        array[curr_index], array[parent_idx] = array[parent_idx], array[curr_index]
        curr_index = parent_idx
      else 
        return array
      end 

    end 
    array
  end
end
