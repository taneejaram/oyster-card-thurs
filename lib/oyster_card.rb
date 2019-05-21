class OysterCard

  attr_reader :balance,  :entry_station, :exit_station
  DEFAULT_LIMIT = 90
  MINIMUM = 1
  FARE = 2

  def initialize
    @balance = 0
    @entry_station =  nil
  end

  def display_balance
    @balance
  end

  def top_up(money)
    @balance += money
    raise "Top up limit exceeded" if @balance > DEFAULT_LIMIT
    @balance
  end

  def touch_in(station)
    raise "You need a minimum of £1" if @balance < MINIMUM
    @entry_station = station
    journey = Journey.new
    journey.entry_station = station
  end

  def touch_out(fare = FARE, station)
    deduct(fare)
    @exit_station = station
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance = @balance - fare
  end

end
