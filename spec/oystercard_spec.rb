require 'oystercard'
require 'money'

# in spec/oystercard_spec.rb
describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up(1) }.to change{ subject.balance }.by 1
    end

    it 'raises error if maximum balance limit of $90 reached' do
      subject.top_up(90)
      expect { subject.top_up(1) }.to raise_error 'Cannot input that amount! Maximum balance of $90 will be exceeded'
    end
  end

end

# ISSUE COMMENTS - NameError: uninitialized constant Oystercard
# File path = ./spec/oystercard_spec
# LINE OF ERROR = # ./spec/oystercard_spec.rb:2:in `<top (required)>'
