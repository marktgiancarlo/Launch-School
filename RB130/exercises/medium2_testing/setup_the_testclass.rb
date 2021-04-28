require 'minitest/autorun'
require_relative 'transaction.rb'
require_relative 'cash_register.rb'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @trans = Transaction.new(50)
  end
  
  def test_accept_money
    @trans.amount_paid = 50
    prev_amount = @register.total_money
    @register.accept_money(@trans)
    assert_equal(prev_amount + 50, @register.total_money)
  end

  def test_change_method
    @trans.amount_paid = 70
    assert_equal(20, @register.change(@trans))
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") { @register.give_receipt(@trans) }
  end
end

class TransactionTest < Minitest::Test
  def setup
    @input = StringIO.new("30\n")
    @output = StringIO.new
    @trans = Transaction.new(30)
  end
  
  def test_prompt_for_payment
    @trans.prompt_for_payment(input: @input, output: @output)
    assert_equal(30, @trans.amount_paid)
  end
end