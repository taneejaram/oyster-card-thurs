class OysterCard

  attr_reader :balance, :journey
  DEFAULT_LIMIT = 90
  MINIMUM = 1
  FARE = 2

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(money)
    @balance += money
    raise "Top up limit exceeded" if @balance > DEFAULT_LIMIT
    @balance
  end

  def touch_in
    raise "You need a minimum of £1" if @balance < MINIMUM
    # @journey.start(entry_station)
  end

  def touch_out(fare = FARE)
    if @journey.complete? then deduct(fare)
    else deduct(penalty)
    # @journey.stop(station)
  end

  private

  def deduct(fare)
    @balance -= fare
  end


end
