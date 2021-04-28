class Element
  attr_reader :datum, :next

  def initialize(datum, next_ele=nil)
    @datum = datum
    @next = next_ele
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :list
  def initialize
    @list = []
  end

  def head
    @list.first
  end

  def size
    @list.size
  end

  def peek
    size > 0 ? head.datum : nil
  end

  def pop
    @list.shift.datum
  end

  def push(val)
    link = size > 0 ? @list.first : nil
    ele = Element.new(val, link)
    @list.prepend(ele)
  end

  def empty?
    @list.size.zero?
  end

  def self.from_a(arr)
    list = new
    return list if arr == nil || arr == []
    arr.reverse.each { |ele| list.push(ele) }
    list
  end

  def reverse
    r_list = SimpleLinkedList.new
    @list.each do |ele|
      r_list.push(ele.datum)
    end
    r_list
  end

  def to_a
    @list.each.with_object([]) { |ele, obj| obj << ele.datum }
  end
end 

list = SimpleLinkedList.from_a([1, 2])
p list_r = list.reverse