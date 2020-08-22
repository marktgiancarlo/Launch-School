arr = ['Mark', 'Kait', 'Nicole']
arr.each_with_index {
  |name, idx| puts "#{name}; #{idx.to_s}"
}

