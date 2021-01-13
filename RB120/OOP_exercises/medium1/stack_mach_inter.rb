class ValidateCommandError < StandardError; end
class EmptyStackError < StandardError; end
class MinilangError < StandardError; end



class Minilang
  VALID_COMMANDS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT'].freeze
  
  attr_reader :commands
  attr_accessor :stack, :register
  
  def initialize(commands)
    @stack = []
    @register = 0
    @commands = commands.split(' ')
  end

  def eval
    commands.each { |command| eval_command(command) }
  rescue MinilangError => e
    puts e.message
  end

  private

  def eval_command(command)
    if VALID_COMMANDS.include?(command)
      send command.downcase
    elsif /\A[-+]?\d+\z/ === command
      self.register = command.to_i
    else
      raise ValidateCommandError, "Invalid token: #{command}"
    end
  end

  def pop
    raise EmptyStackError, "Empty stack!" if stack.empty?
    self.register = stack.pop
  end

  def push
    stack.push(register)
  end

  def add
    self.register += pop
  end

  def div
    self.register /= pop
  end

  def mod
    self.register %= pop
  end

  def mult
    self.register *= pop
  end

  def sub
    self.register -= pop
  end

  def print
    puts register
  end
end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)