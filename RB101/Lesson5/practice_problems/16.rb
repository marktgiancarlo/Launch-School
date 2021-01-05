def generate_UUID()
  new_uuid = ''
  hex = '1234567890abcdef'.split('')
  sect_length = [8,4,4,4,12]
  sect_length.each do |section|
    section.times { |x| new_uuid << hex.sample }
    new_uuid << '-'
  end
  new_uuid.delete_suffix!('-')
end

UUID()