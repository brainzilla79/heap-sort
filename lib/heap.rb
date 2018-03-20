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
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
