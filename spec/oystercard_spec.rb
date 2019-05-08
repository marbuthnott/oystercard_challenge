require 'oystercard'
require 'money'

# in spec/oystercard_spec.rb
describe Oystercard do
  subject(:oystercard) { described_class.new }

  it 'has a balance of zero' do
    expect(oystercard.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ oystercard.top_up(1) }.to change{ oystercard.balance }.by 1
    end

    it 'raises error if capacity is exceeded' do
      capacity = Oystercard::CAPACITY
      oystercard.top_up(90)
      expect { oystercard.top_up(1) }.to raise_error "Cannot input that amount! Maximum balance of #{capacity} will be exceeded"
    end
  end

  describe '#deduct' do
    it 'deducts from the balance' do
      expect { oystercard.deduct(3) }.to change{ oystercard.balance }.by (-3)
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }

    it 'is initially not in a journey' do
      expect(oystercard.in_journey).to eq(false)
    end

    it 'can touch in' do
      oystercard.touch_in
      expect(oystercard.in_journey).to eq(true)
    end
  end

  describe '#touch_out' do
    it 'can touch out' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey).to eq(false)
    end
  end



end

# ISSUE COMMENTS - NameError: uninitialized constant Oystercard
# File path = ./spec/oystercard_spec
# LINE OF ERROR = # ./spec/oystercard_spec.rb:2:in `<top (required)>'
