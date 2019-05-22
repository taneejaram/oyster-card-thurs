class OysterCard

  attr_reader :entry_station, :exit_station, :journeys, :balance, :journeys2
  DEFAULT_LIMIT = 90
  MINIMUM = 1
  FARE = 2

  def initialize(journey = Journey.new)
    @balance = 0
    @entry_station = nil
    @journeys = []
    @journeys2 =[]
    @journey = journey
  end

  def top_up(money)
    @balance += money
    raise "Top up limit exceeded" if @balance > DEFAULT_LIMIT
    @balance
  end

  def touch_in(station)
    raise "You need a minimum of £1" if @balance < MINIMUM
    @journey.start(station)
    @entry_station = station
  end

  def touch_out(fare = FARE, station)
    deduct(fare)
    @journey.stop(station)
    @exit_station = station
    store_trips
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def store_trips
    @journeys.push({entry_station: @entry_station, exit_station: @exit_station})
    @journeys2.push(@journey)
  end









end
