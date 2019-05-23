require './lib/oyster_card'

describe OysterCard do

  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  let(:journey) { double(:journey).as_null_object }
  let(:oyster_card) { OysterCard.new(journey) }

  it 'can get the current balance on the oyster card' do
    oyster_card.top_up(10)
    expect(oyster_card.balance).to eq(10)
  end

  it 'balance can be topped up' do
    expect(oyster_card.top_up(10)).to eq(10)
  end

  it 'sets a limit of £90 on the card' do
    oyster_card.top_up(90)
    expect{oyster_card.top_up(1)}.to raise_error "Top up limit exceeded"
  end

  # it 'can deduct a fare from the card' do
  #   oyster_card.top_up(OysterCard::DEFAULT_LIMIT)
  #   oyster_card.touch_out(90)
  #   expect(oyster_card.balance).to eq(0)
  # end

  it 'needs a minimum of £1' do
    expect{oyster_card.touch_in}.to raise_error "You need a minimum of £1"
  end

  it 'will deduct a fare when you complete a journey' do
    oyster_card.top_up(10)
    expect{ oyster_card.touch_out(2) }.to change { oyster_card.balance }.by(-2)
  end

  # it 'remembers the entry station after touch in' do
  #   oyster_card.top_up(10)
  #   oyster_card.touch_in
  #   expect(oyster_card.entry_station).to eq(entry_station)
  # end

  # it 'forgets the entry station on touch out' do
  #   oyster_card.top_up(10)
  #   oyster_card.touch_in(entry_station)
  #   oyster_card.touch_out(2)
  #   expect(oyster_card.entry_station).to eq(nil)
  # end
  it 'will deduct a penalty fare when no touch in' do
    oyster_card.top_up(10)
    oyster_card.touch_out(2)
    expect{ oyster_card.touch_out }.to change { oyster_card.balance }.by(-6)
  end
end
