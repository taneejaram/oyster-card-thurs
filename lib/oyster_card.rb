class OysterCard

  attr_reader :balance, :in_journey
  DEFAULT_LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def display_balance
    @balance
  end

  def top_up(money)
    @balance += money
    raise "Top up limit exceeded" if @balance > DEFAULT_LIMIT
    @balance
  end

  def deduct(fare)
    @balance = @balance - fare
  end

  def touch_in
    raise "You need a minimum of £1" if @balance < MINIMUM
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
