def raptors(arr)
    raptors = yield(arr)
end

a = %w(raven finch hawk eagle)
raptors(a) { |_,_,*raptors| puts "Raptors: #{raptors.join(', ')}." }