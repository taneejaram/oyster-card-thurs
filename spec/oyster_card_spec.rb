require './lib/oyster_card'

describe OysterCard do

  it 'can respond to a method that displays the balance' do
    oyster_card = OysterCard.new
    expect(oyster_card).to respond_to(:display_balance)
  end

  it 'can get the current balance on the oyster card' do
    oyster_card = OysterCard.new
    expect(oyster_card.display_balance).to eq(oyster_card.balance)
  end

  it 'balance can be topped up' do
    oyster_card = OysterCard.new
    expect(oyster_card.top_up(10)).to eq(10)
  end

  it 'sets a limit of £90 on the card' do
    oyster_card = OysterCard.new
    oyster_card.top_up(90)
    expect{oyster_card.top_up(1)}.to raise_error "Top up limit exceeded"
  end

  # it 'can deduct a fare from the card' do
  #   oyster_card = OysterCard.new
  #   oyster_card.top_up(OysterCard::DEFAULT_LIMIT)
  #   oyster_card.touch_out(90)

  #   expect(oyster_card.balance).to eq(0)
  # end

  it 'can touch in at a barrier' do
    oyster_card = OysterCard.new
    oyster_card.top_up(5)
    oyster_card.touch_in
    expect(oyster_card.in_journey).to be true
  end

  it 'can touch out' do
    oyster_card = OysterCard.new
    oyster_card.touch_out(2)
    expect(oyster_card.in_journey).to be false
  end

  it 'needs a minimum of £1' do
    oyster_card = OysterCard.new
    expect{oyster_card.touch_in}.to raise_error "You need a minimum of £1"
  end

  it 'will deduct a fare when you complete a journey' do
    oyster_card = OysterCard.new
    oyster_card.top_up(10)
    expect{ oyster_card.touch_out(2) }.to change { oyster_card.balance }.by(-2)
  end

end
