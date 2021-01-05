# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = 'aeiou'

hsh.each do |_, v|
  v.each do |word|
    word.chars.each do |char|
      if vowels.include?(char)
        puts char
      end
    end
  end
end

