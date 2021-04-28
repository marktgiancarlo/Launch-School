class CustomSet
  attr_reader :set

  def initialize(set=[])
    @set = set
  end

  def empty?
    @set.empty?
  end

  def contains?(ele)
    @set.include?(ele)
  end

  def subset?(other)
    @set.all? { |ele| other.set.include?(ele) }
  end

  def disjoint?(other)
    @set.none? { |ele| other.set.include?(ele) }
  end

  def eql?(other)
    @set.sort.uniq == other.set.sort.uniq
  end

  def add(element)
      @set << element
      self
  end

  def ==(other)
    eql?(other)
  end

  def intersection(other)
    min, max = [self, other].sort { |a, b| a.set.length <=> b.set.length }
    set = max.set.each_with_object([]) do |ele, obj|
      obj << ele if min.set.include?(ele)
    end
    CustomSet.new(set)
  end

  def difference(other)
    set = @set.each_with_object([]) do |ele, obj|
      obj << ele if !intersection(other).set.include?(ele)
    end
    CustomSet.new(set)
  end

  def union(other)
    set = (@set + other.set).uniq
    CustomSet.new(set)
  end
end