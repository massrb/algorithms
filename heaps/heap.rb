class Heap
  attr_reader :data, :comparator

  # convert block passed to a proc via '&'
  def initialize(&comparator)
    @data = []
    @comparator = comparator
  end

  def get_data
    @data
  end

  def size
    @data.size
  end

  def empty?
    @data.empty?
  end

  def push(val)
    @data << val
    heapify_up(@data.size - 1)
  end

  def pop
    return nil if empty?
    swap(0, @data.size - 1)
    val = @data.pop
    heapify_down(0)
    val
  end

  def peek
    @data[0]
  end

  def print_tree(index = 0, indent = "", last = true)
    return if index >= @data.size

    puts "#{indent}#{last ? "└──" : "├──"} #{@data[index]}"
    indent += last ? "    " : "│   "

    left_index = 2 * index + 1
    right_index = 2 * index + 2

    has_left = left_index < @data.size
    has_right = right_index < @data.size

    print_tree(left_index, indent, !has_right) if has_left
    print_tree(right_index, indent, true) if has_right
  end

  private

  def heapify_up(index)
    parent = (index - 1) / 2
    return if index <= 0 || comparator.call(@data[parent], @data[index])
    swap(index, parent)
    heapify_up(parent)
  end

  def heapify_down(index)
    child = index * 2 + 1
    return if child >= @data.size
    right = child + 1
    child = right if right < @data.size && comparator.call(@data[child], @data[right])
    return if comparator.call(@data[index], @data[child])
    swap(index, child)
    heapify_down(child)
  end

  def swap(i, j)
    @data[i], @data[j] = @data[j], @data[i]
  end
end