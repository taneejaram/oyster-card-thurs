require './lib/oyster_card'
require './lib/journey'

card = OysterCard.new
journey = Journey.new("Barbican")

card.top_up(10)
entry_station = card.touch_in(journey)  #Barbican
journey.entry_station # Barbican


