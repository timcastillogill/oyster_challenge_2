class Oystercard
  attr_reader :balance, :maximum_limit


  INITIAL_BALANCE = 0
  BALANCE_LIMIT = 90
  MIN_LIMIT = 1

  def initialize(balance = INITIAL_BALANCE, maximum_limit = BALANCE_LIMIT, min_limit = MIN_LIMIT)
    @balance = balance
    @maximum_limit = maximum_limit
    @min_limit = min_limit
  end

  def top_up(value)
    raise "Maximum balance is £#{maximum_limit}." if (@balance + value) > @maximum_limit

    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Balance less than £1. Top up!' if min_balance
    @in_journey = true
  end

  def touch_out
    @in_journey
  end

  def min_balance
    @balance < @min_limit
  end

end