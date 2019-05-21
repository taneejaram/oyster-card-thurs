require './lib/oyster_card'
require './lib/journey'

card = OysterCard.new
journey1 = Journey.new("Barbican", "Upminster")
journey2 = Journey.new("Bow Road", "Barbican")

card.top_up(10)
entry_station = card.touch_in("Barbican")
card.touch_out(2)  #Barbican
card.exit_station #Upminster

card.touch_in("Bow Road")
card.touch_out(2)
card.exit_station #Barbican
