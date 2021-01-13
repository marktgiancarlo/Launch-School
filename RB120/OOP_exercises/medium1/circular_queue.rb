# age determined by nth added to queue
# add from left to right (as open) unless full (replace oldest)
# remove starting with oldest (replace with nil). nil if empty

class CircularQueue
  EMPTY_SPOT = [nil, nil]
  
  attr_accessor :queue, :age

  def initialize(num_obj)
    @queue = Array.new(num_obj, Array.new(2))
    @age = 1
  end

  def enqueue(obj)
    if full?
      remove_and_replace(find_oldest_queue, [obj, age])
    else
      fill_leftmost_open_pos(obj)
    end

    self.age += 1
  end

  def dequeue
    if empty?
      nil
    else
      oldest_queue = find_oldest_queue
      remove_and_replace(oldest_queue, EMPTY_SPOT)
      oldest_queue[0]
    end
  end

  private

  def empty?
    queue.all? { |pos| pos[0].nil? }
  end

  def full?
    queue.all? { |pos| !pos[0].nil? }
  end

  def fill_leftmost_open_pos(obj)
    queue[queue.index([nil, nil])] = [obj, age]
  end

  def find_oldest_queue
    remove_nil = queue.select { |pos| !pos[0].nil? }
    remove_nil.min { |a, b| a[1] <=> b[1] }
  end

  def remove_and_replace(queue_spot, replacement)
    index = queue.index(queue_spot)
    queue[index] = replacement
  end

end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil