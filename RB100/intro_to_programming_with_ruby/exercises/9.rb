h = {a:1, b:2, c:3, d:4}
p h[:b]
h[:e] = 5
h.select! {|k, v| v > 3.5}
p h