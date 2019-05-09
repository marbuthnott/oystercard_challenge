class Oystercard

  attr_reader :balance
  attr_accessor :journeys, :journey
  CAPACITY = 90
  MINIMUM = 1
  MINIMUM_CHARGE = 3

  def initialize(balance = 0)
    @balance = balance
    @journey = { entry_station: nil, exit_station: nil }
    @journeys = []
  end

  def top_up(amount)
    raise "Cannot input that amount! Maximum balance of #{CAPACITY} will be exceeded" if  @balance + amount > CAPACITY
    @balance += amount
  end

  def touch_in(station)
    raise "Cannot touch in: balance below minimum of £#{MINIMUM}. Top up." if @balance < MINIMUM
    @journey[:entry_station] = station
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @journey[:exit_station] = station
    @journeys << @journey
    @journey = { entry_station: nil, exit_station: nil }
  end

  def in_journey?
    !@journey[:entry_station].nil?
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
