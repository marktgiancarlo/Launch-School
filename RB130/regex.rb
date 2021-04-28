def url?(str)
  !!str.match(/\Ahttps?:\/\/\S+.com\z/)
end

url?('http://launchschool.com')   # -> true
url?('https://example.com')       # -> true
url?('https://example.com hello') # -> false
url?('   https://example.com')    # -> false

def fields(str)
  str.split(/[ \t,]{1,}/)
end

fields("Pete,201,Student")
# -> ['Pete', '201', 'Student']

fields("Pete \t 201    ,  TA")
# -> ['Pete', '201', 'TA']

fields("Pete \t 201")
# -> ['Pete', '201']

fields("Pete \n 201")
# -> ['Pete', '\n', '201']

def mystery_math(str)
  new_str = str.gsub(/([\+\-\*\/])/, '?')
end

mystery_math('4 + 3 - 5 = 2')
# -> '4 ? 3 - 5 = 2'

mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# -> '(4 ? 3 + 2) / 7 - 1 = 1'

def danish(str)
  str.sub(/\b(apple|cherry|blueberry)/, 'danish')
end

danish('An apple a day keeps the doctor away')
# -> 'An danish a day keeps the doctor away'

danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'

danish('The cherry of my eye')
# -> 'The danish of my eye'

danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'

danish('I love pineapple')
# -> 'I love pineapple'

def format_date(date)
  if date.match(/\d{4}([\-\/])\d{2}\1\d{2}/)
    n = date.split(/[\-\/]/)
    [n[2], n[1], n[0]].join('.')
  else
    date
  end
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)