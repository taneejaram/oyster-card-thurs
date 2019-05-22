require_relative '../lib/oyster_card'

card = OysterCard.new

card.top_up(10)
card.touch_in("Barbican")
card.touch_out(2, "Liverpool St")
card.journeys

journey = Journey.new

journey.start(station)

journey.entry_station
#  => station

journey.end(exit_station)
# => exit_station


journey.is_complete?

journey.fare