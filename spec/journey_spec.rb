require './lib/journey'
describe Journey do
  it 'has an entry_station' do
    journey = Journey.new("Barbican")
    expect(journey).to respond_to(:entry_station)
  end

  it 'knows the name of the entry station' do
    journey = Journey.new("Barbican")
    expect(journey.entry_station).to eq("Barbican")
  end

  it 'has an entry and exit station' do
    journey = Journey.new
    
  end

end
