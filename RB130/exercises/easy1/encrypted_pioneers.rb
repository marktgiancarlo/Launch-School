# ' ' or '-' spearates each name
# iterate over each pioneer and convert char if not - or space
# how to deal with capitals letters?
  # if letter.downcase != letter, decoded_letter.upcase

CIPHER = {0=>"a", 1=>"b", 2=>"c", 3=>"d", 4=>"e", 5=>"f", 6=>"g",
          7=>"h", 8=>"i", 9=>"j", 10=>"k", 11=>"l", 12=>"m", 13=>"n",
          14=>"o", 15=>"p", 16=>"q", 17=>"r", 18=>"s", 19=>"t", 20=>"u",
          21=>"v", 22=>"w", 23=>"x", 24=>"y", 25=>"z"}

def decrypt(name)
  decipher = ''
  for char in name.split('')
    if char == ' ' || char == '-'
      decipher << char
    else
      new_key = (CIPHER.key(char.downcase).to_i + 13) % 26
      if char.downcase == char
        decipher << CIPHER[new_key]
      else
        decipher << CIPHER[new_key].upcase
      end
    end
  end

  decipher
end

pioneers = 'Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu'

pioneers.split("\n").each do |pioneer|
  puts decrypt(pioneer)
end