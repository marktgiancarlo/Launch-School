class Octal
  def initialize(num_str)
    @num_str = num_str
  end

  def to_decimal
    return 0 if invalid_octal?
    decimal = 0
    @num_str.split('').reverse.each_with_index do |digit, i|
      decimal += digit.to_i * (8 ** i)
    end
    decimal
  end

  private

  def invalid_octal?
    @num_str.match(/[^0-7]/)
  end
end