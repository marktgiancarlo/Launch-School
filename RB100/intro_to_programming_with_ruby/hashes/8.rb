words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
anagrams = {}
words.each { |word| 
  letters = word.chars.sort
  if anagrams.has_key?(letters)
    anagrams[letters] << word
  else
    anagrams[letters] = [word]
  end
}
anagrams.each_key { |key| p anagrams[key] }