require './lib/oyster_card.rb'
require './lib/journey.rb'

card = OysterCard.new

card.top_up(10)
card.touch_out(2)
