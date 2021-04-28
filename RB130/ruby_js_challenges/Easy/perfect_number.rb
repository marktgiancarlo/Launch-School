class PerfectNumber
    def self.classify(num)
      raise StandardError if num <= 0
      case PerfectNumber.aliquot_sum(num) <=> num
      when 1 then 'abundant'
      when 0 then 'perfect'
      when -1 then 'deficient'
      end
    end

    def self.aliquot_sum(num)
      PerfectNumber.divisors(num).sum
    end

    def self.divisors(num)
      div = []
      for i in (1..num/2)
        div << i if num % i == 0
      end
      div
    end
end