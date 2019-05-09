require 'oystercard'
require 'money'

# in spec/oystercard_spec.rb
describe Oystercard do
  subject(:oystercard) { described_class.new(5) }
  let (:station) { double(:station) }
  let (:entry_station) { double(:station) }
  let (:exit_station) { double(:station) }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  context 'instance variables for Oystercard class' do

    it 'has a default balance of zero' do
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq(0)
    end

    it 'stores a journey' do
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journeys).to include journey
    end

    it 'starts with no journeys stored' do
      expect(oystercard.journeys.empty?).to eq true
    end 
  
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ oystercard.top_up(1) }.to change{ oystercard.balance }.by 1
    end

    it 'raises error if capacity is exceeded' do
      oystercard = Oystercard.new
      capacity = Oystercard::CAPACITY
      oystercard.top_up(90)
      expect { oystercard.top_up(1) }.to raise_error "Cannot input that amount! Maximum balance of #{capacity} will be exceeded"
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }

    it 'is initially not in a journey' do
      expect(oystercard.in_journey?).to eq(false)
    end

    it 'records our entry station' do
      oystercard.touch_in(entry_station)
      expect(oystercard.journey[:entry_station]).to eq entry_station
    end

    it 'raises an error when balance is less than minimum balance' do
      oystercard = Oystercard.new
      minimum = Oystercard::MINIMUM
      expect { oystercard.touch_in(station) }.to raise_error "Cannot touch in: balance below minimum of £#{minimum}. Top up."
    end
  end

  describe '#touch_out' do
    it 'deducts my fare' do
      expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by (-Oystercard::MINIMUM_CHARGE)
    end

    # it 'forgets the entry station' do
    #   oystercard.touch_in(station)
    #   oystercard.touch_out
    #   expect(oystercard.entry_station).to eq(nil)
    # end

    it 'records our exit station' do
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station) 
      expect(oystercard.journeys[-1][:exit_station]).to eq exit_station
    end

  end

  describe '#in_journey?' do
    it 'returns true when touched in' do
      oystercard.touch_in(station)
      expect(oystercard.in_journey?).to eq true
    end
    
    it 'returns false when touched out' do
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.in_journey?).to eq false
    end
  end

  
end

# ISSUE COMMENTS - NameError: uninitialized constant Oystercard
# File path = ./spec/oystercard_spec
# LINE OF ERROR = # ./spec/oystercard_spec.rb:2:in `<top (required)>'
