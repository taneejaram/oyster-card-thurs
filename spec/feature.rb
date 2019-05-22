require_relative '../lib/oyster_card'

card = OysterCard.new

card.top_up(10)
card.touch_in("Barbican")
card.touch_out(2, "Liverpool St")
card.trip
