require './lib/station'

describe Station do

  let(:station) { Station.new("Barbican", 1) }
  it 'can create a station with a name and a zone' do
    expect(station.name).to eq("Barbican")
  end

  it 'can expose a zone variable' do
    expect(station.zone).to be(1)
  end

end
