require 'journey'

describe Journey do
  let(:journey) { Journey.new }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

  it 'can start' do
    journey.start(entry_station)
    expect(journey.entry_station).to be entry_station
  end

  it 'can stop' do
    journey.stop(exit_station)
    expect(journey.exit_station).to be exit_station
  end

  it 'is complete after starting then stopping' do
    journey.start(entry_station)
    journey.stop(exit_station)
    expect(journey).to be_complete
  end

  it 'has an empty list of journeys by default' do
    expect(journey.journeys).to eq([])
  end

  it 'stores the journey in a journeys array' do
    journey.start(entry_station)
    journey.stop(exit_station)
    journey.store_journey
    expect(journey.journeys).to eq([{:entry_station => entry_station, :exit_station => exit_station}])
  end

end
