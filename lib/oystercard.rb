class Oystercard

  attr_reader :balance
  CAPACITY = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise 'Cannot input that amount! Maximum balance of $90 will be exceeded' if full?
    @balance += money
  end

  def full?
    @balance >= CAPACITY
  end

end
