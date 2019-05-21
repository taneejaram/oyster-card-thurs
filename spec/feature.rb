require './lib/oyster_card'
require './lib/journey'

card = OysterCard.new
journey = Journey.new

card.top_up(10)
card.touch_in("Barbican")
journey.entry_station
