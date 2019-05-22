class OysterCard

  attr_reader :entry_station, :exit_station, :journeys, :balance
  DEFAULT_LIMIT = 90
  MINIMUM = 1
  FARE = 2

  def initialize
    @balance = 0
    @entry_station =  nil
    @journeys = []
  end

  def top_up(money)
    @balance += money
    raise "Top up limit exceeded" if @balance > DEFAULT_LIMIT
    @balance
  end

  def touch_in(station)
    raise "You need a minimum of £1" if @balance < MINIMUM
    @entry_station = station
  end

  def touch_out(fare = FARE, station)
    deduct(fare)
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
  end









end
