class Triangle
  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    @sides = [s1, s2, s3]
    raise ArgumentError unless valid_triangle?
  end

  def kind
    case @sides.uniq.length
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  private

  def valid_triangle?
    return false if @sides.any? { |side| side <= 0 }
    return false if @s1 + @s2 < @s3 || @s1 + @s3 < @s2 || @s2 + @s3 < @s1
    true
  end
end