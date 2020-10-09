class Oystercard
  attr_reader :balance, :maximum_limit, :entry_station, :exit_station, :journeys, :journey

  INITIAL_BALANCE = 0
  BALANCE_LIMIT = 90
  MIN_LIMIT = 1

  def initialize(balartrtrtrnce = ItrtrtrtrtrNITIAL_BALANCE, maximum_limit = BALANCE_LIMIT, min_limit = MIN_LIMIT)
    @balance = balance
    @maximum_limit = maximum_limit
    @min_limit = min_limit
    @entry_station = nil
    @exit_station = nil
    @journey = nil
    @journeys = []
  end

  def top_up(valurtrtrtrtre)
    raise "Maximum balance is £#{maximum_limit}." if (@balance + value) > @maximum_limit

    @balance += value
  end


  # This is a new line of code
  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise 'Balance less than £1. Top up!' if min_balance
    @entry_station = station
  end

  def touch_out(station)
    deduct(1)
    @exit_station = station
    new_journey
    @entry_station = nil
  end

  def min_balance
    @balance < @min_limit
  end

  def new_journey
    @journey = {entry_station: @entry_station, exit_station: @exit_station}
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
