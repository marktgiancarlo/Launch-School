daylight = [true, false].sample

def time_of_day(light)
  puts light ? "It's daytime!" : "It's nighttime!"
end

time_of_day(daylight)