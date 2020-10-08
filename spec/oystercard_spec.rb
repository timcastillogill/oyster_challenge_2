require 'oystercard'

describe Oystercard do
  let(:station) { double :station }

  it 'should have a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'should increase balance by 20' do
    subject.top_up(20)
    expect(subject.balance).to eq 20
  end

  it 'should not exceed the balance of #{subject.maximum limit}' do
    maximum_limit = Oystercard::BALANCE_LIMIT
    subject.top_up(maximum_limit)
    expect { subject.top_up(1) }
      .to raise_error "Maximum balance is £#{subject.maximum_limit}."
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it "can touch in" do
    subject.top_up(20)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq true
  end

  it "checks that the balance is at least £1" do
    expect { subject.touch_in(station) }.to raise_error 'Balance less than £1. Top up!'
  end

  it 'updates in_journey to false' do
      subject.touch_out(station)
      expect(subject.in_journey?).to be false
    end

  it 'updates in_journey to true' do
    subject.top_up(50)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq true
  end

  it 'stores the entry station on touch_in' do
    subject.top_up(50)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

  it 'checks if card has an empty list of journey' do
    expect(subject.journeys).to eq []
  end

  it 'checks that touching in and out creates one journey' do
    subject.top_up(10)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
    subject.touch_out(station)
    expect(subject.exit_station).to eq station
  end

end
