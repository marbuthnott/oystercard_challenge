describe 'User Stories' do
    # In order to pay for my journey
    # As a customer
    # I need my fare deducted from my card

  # it 'pays for journey; by deducting fare from card' do
  #   oystercard = Oystercard.new
  #   expect { oystercard.deduct(3) }.to change { oystercard.balance }.by (-3)
  # end

  # In order to get through the barriers.
  # As a customer
  # I need to touch in and out.

  # context 'gets in and out of the barriers' do
  #   it 'gets inside the barriers; by touching in' do
  #     oystercard = Oystercard.new
  #     oystercard.touch_in
  #     expect(oystercard.in_journey?).to eq true
  #   end

  #   it 'gets outside the barriers; by touching out' do
  #     oystercard = Oystercard.new
  #     oystercard.touch_out
  #     expect(oystercard.in_journey?).to eq false
  #   end
  # end

# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.

    # it 'needs a default minimum amount (£1) for a single journey' do
    #   oystercard = Oystercard.new
    #   expect { oystercard.touch_in }.to raise_error
    # end

    # In order to pay for my journey
    # As a customer
    # When my journey is complete, I need the correct amount deducted from my card

  # it 'completes my journey; by deducting my fare' do
  #   oystercard = Oystercard.new
  #   oystercard.top_up(5)
  #   expect { oystercard.touch_out(3) }.to change { oystercard.balance }.by (-3)
  # end

# In order to pay for my journey
# As a customer
# I need to know where I've travelled from

  # In order to know where I have been
  # As a customer
  # I want to see all my previous trips

  let (:station) { double(:station) }
  let (:entry_station) { double(:station) }
  let (:exit_station) { double(:station) }

  it 'will know where I have been by letting me see all previous trips' do
    oystercard = Oystercard.new(20)
    oystercard.touch_in(entry_station)
    oystercard.touch_out(exit_station)
    expect(oystercard.journeys).to eq [ { entry_station: entry_station, exit_station: exit_station } ]
  end


end