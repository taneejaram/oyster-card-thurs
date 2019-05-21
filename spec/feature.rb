require './lib/oyster_card'

card = OysterCard.new

card.top_up(10)
card.touch_in
card.in_journey

card.touch_out
card.balance