# frozen_string_literal: true

require './lib/oystercard.rb'

p my_oyster_card = Oystercard.new
p 'this is balance'
p my_oyster_card.balance
p my_oyster_card.top_up(20)
# p my_oyster_card.top_up(100)
p my_oyster_card.touch_out
p my_oyster_card.in_journey?
# p my_oyster_card.journey
p my_oyster_card.journeys


{entry_station => "seven sisters", exit_station => "kingston upon thames"}


#
# journeys =[]
#
# journey1 = [{entry_station => "Seven Sisters"}, {exit_station => "Kingston Station"}]
#
# journey1.each do |journey|
#   journeys << journey
# end
