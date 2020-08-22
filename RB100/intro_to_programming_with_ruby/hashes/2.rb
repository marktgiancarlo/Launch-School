#merge! mutates the original array and merge returns a new array
a = {tennis: "ball", august: "rush"}
b = {orange: "flower", alphabetical: "order"}
a.merge(b)
p a
p b
a.merge!(b)
p a
p b