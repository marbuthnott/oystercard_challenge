describe 'User Stories' do
    # In order to pay for my journey
    # As a customer
    # I need my fare deducted from my card

  it 'pays for journey; by deducting fare from card' do
    oystercard = Oystercard.new
    expect { oystercard.deduct(3) }.to change { oystercard.balance }.by (-3)
  end
end