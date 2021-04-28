class RomanNumeral
  NUMERALS = [{ '1' => 'I', '2' => 'II', '3' => 'III', '4' => 'IV', '5' => 'V',
               '6' => 'VI', '7' => 'VII', '8' => 'VIII', '9' => 'IX' }, 
              { '1' => 'X', '2' => 'XX', '3' => 'XXX', '4' => 'XL', '5' => 'L',
              '6' => 'LX', '7' => 'LXX', '8' => 'LXXX', '9' => 'XC' },
              { '1' => 'C', '2' => 'CC', '3' => 'CCC', '4' => 'CD', '5' => 'D',
              '6' => 'DC', '7' => 'DCC', '8' => 'DCCC', '9' => 'CM' },
              { '1' => 'M', '2' => 'MM', '3' => 'MMM' }]

  def initialize(dec_num)
    @dec_num = dec_num
  end

  def to_roman
    digits = @dec_num.to_s.split('').reverse
    digits.each_with_index.with_object('') do |(digit, i), obj|
       obj.prepend(NUMERALS[i][digit]) unless digit == '0'
    end
  end
end

p RomanNumeral.new(1).to_roman

# take num. starting in ones position convert. proceed thru each tier until number is gone.