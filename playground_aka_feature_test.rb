# frozen_string_literal: true

require './lib/oystercard.rb'

p my_oyster_card = Oystercard.new
p 'this is balance'
p my_oyster_card.balance
p my_oyster_card.top_up(20)
# p my_oyster_card.top_up(100)
p my_oyster_card.deduct(2)
p my_oyster_card.min_balance