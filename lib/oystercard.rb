class Oystercard

  attr_reader :balance, :in_journey
  CAPACITY = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Cannot input that amount! Maximum balance of #{CAPACITY} will be exceeded" if  @balance + amount > CAPACITY
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Cannot touch in: balance below minimum of £#{MINIMUM}. Top up." if @balance < MINIMUM
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
