def convert_to_base_8(n)
  n.divmod(8).join.to_i
end

base8_proc = method(:convert_to_base_8).to_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc)