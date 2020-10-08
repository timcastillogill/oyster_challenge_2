class Oystercard
  attr_reader :balance, :maximum_limit, :entry_station


  INITIAL_BALANCE = 0
  BALANCE_LIMIT = 90
  MIN_LIMIT = 1

  def initialize(balance = INITIAL_BALANCE, maximum_limit = BALANCE_LIMIT, min_limit = MIN_LIMIT)
    @balance = balance
    @maximum_limit = maximum_limit
    @min_limit = min_limit
    @entry_station = nil
  end

  def top_up(value)
    raise "Maximum balance is £#{maximum_limit}." if (@balance + value) > @maximum_limit

    @balance += value
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise 'Balance less than £1. Top up!' if min_balance
    @entry_station = station
  end

  def touch_out
    deduct(1)
    @entry_station = nil
  end

  def min_balance
    @balance < @min_limit
  end

  private 
  def deduct(fare)
    @balance -= fare
  end

end