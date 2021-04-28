class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(num)
    SumOfMultiples.to(num, @multiples)
  end
  
  def self.to(num, args=[3, 5])
    multiples = []
    (1...num).each { |n| args.each { |mult| multiples << n if n % mult == 0 }}
    multiples.empty? ? 0 : multiples.uniq.reduce(:+)
  end
end
