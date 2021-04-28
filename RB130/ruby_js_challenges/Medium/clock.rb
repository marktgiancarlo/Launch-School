class Clock
  def self.at(hours, minutes=0)
    total_minutes = hours * 60 + minutes
    Clock.new(total_minutes)
  end

  def initialize(total_minutes)
    convert_time(total_minutes)
  end

  def convert_time(total_minutes)
    @total_minutes = total_minutes % 1440
    @hours = @total_minutes / 60
    @minutes = @total_minutes % 60
  end

  def +(min)
    @total_minutes += min
    self
  end

  def -(min)
    @total_minutes = (@total_minutes - min) % 1440
    self
  end

  def ==(other)
    other.total_minutes == @total_minutes
  end

  def to_s
    convert_time(@total_minutes)
    "#{sprintf('%02d', @hours)}:#{sprintf('%02d', @minutes)}"
  end

  protected

  attr_reader :total_minutes
end

p Clock.at(0, 30) - 60