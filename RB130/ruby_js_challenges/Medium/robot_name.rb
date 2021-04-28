# reset wipes name
# name assigns new random name
  # dont use the same name twice


class Robot
  PREFIX = ('AA'..'ZZ').to_a.freeze
  SUFFIX = ('000'..'999').to_a.freeze

  @@names = []

  def initialize
    @name = name
  end

  def name
    return @name if @name != nil
    while @@names.include?(@name) || @name == nil
      @name = PREFIX.sample + SUFFIX.sample
    end
    @@names << @name
    @name
  end

  def reset
    @name = nil
  end
end

p Robot.new.name