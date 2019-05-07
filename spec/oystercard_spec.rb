require 'oystercard'

# in spec/oystercard_spec.rb
describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

end

# ISSUE COMMENTS - NameError: uninitialized constant Oystercard
# File path = ./spec/oystercard_spec
# LINE OF ERROR = # ./spec/oystercard_spec.rb:2:in `<top (required)>'
