class Series
  def initialize(str)
    @str = str.split('')
  end

  def slices(len_of_slice)
    raise ArgumentError if len_of_slice > @str.length
    i = 0
    slices = []
    while i <= @str.length - len_of_slice
      slice = (i...(i + len_of_slice)).each.with_object([]) do |idx, obj|
        obj << @str[idx].to_i
      end
      slices << slice
      i += 1
    end
    slices
  end
end