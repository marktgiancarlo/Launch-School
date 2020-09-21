WORDS = {adjective: %w(quick lazy sleepy ugly),
        noun: %w(fox dog head leg),
        verb: %w(jumps lifts bites licks),
        adverb: %w(easily lazily noisily excitedly)
      }
File.open("madlibs.txt") do |file|
  file.each do |line|
    puts format(line, noun: WORDS[:noun].sample,
                      verb: WORDS[:verb].sample,
                      adjective: WORDS[:adjective].sample,
                      adverb: WORDS[:adverb].sample)
  end
end
