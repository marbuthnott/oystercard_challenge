class Oystercard

  attr_reader :balance, :entry_station
  CAPACITY = 90
  MINIMUM = 1
  MINIMUM_CHARGE = 3

  def initialize(balance = 0)
    @entry_station = nil
    @balance = balance

  end

  def top_up(amount)
    raise "Cannot input that amount! Maximum balance of #{CAPACITY} will be exceeded" if  @balance + amount > CAPACITY
    @balance += amount
  end

  def touch_in(station)
    raise "Cannot touch in: balance below minimum of £#{MINIMUM}. Top up." if @balance < MINIMUM
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
