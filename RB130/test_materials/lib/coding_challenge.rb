class Cipher
  LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  def self.rotate(text, pos)
    letters = text.split('')
    letters.each_with_index do |letter, idx|
      if letter.match(/[A-Za-z]/)
        rotation = (LETTERS.index(letter.upcase) + pos) % 26
        letters[idx] = encrypt(letter, rotation)
      end
    end
    letters.join('')
  end

  def self.encrypt(letter, rot)
    if letter.match(/[A-Z]/)
      LETTERS[rot]
    else
      LETTERS[rot].downcase
    end
  end
end
