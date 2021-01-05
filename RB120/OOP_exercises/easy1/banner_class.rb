class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_reader :message

  def horizontal_rule
    create_line('-', '+')
  end

  def empty_line
    create_line(' ', '|')
  end

  def message_line
    "| #{@message} |"
  end

  def create_line(filler, outsides)
    line = ''
    (@message.length + 2).times do |dash|
      line << "#{filler}"
    end
    line.prepend("#{outsides}")
    line.concat("#{outsides}")
    line
  end
end

banner = Banner.new('')
puts banner

banner2 = Banner.new('To boldly go where no one has gone before.')
puts banner2
