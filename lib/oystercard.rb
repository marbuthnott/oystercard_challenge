class Oystercard

  attr_reader :balance
  CAPACITY = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise 'Cannot input that amount! Maximum balance of $90 will be exceeded' if  @balance + amount > CAPACITY
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
