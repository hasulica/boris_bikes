require 'Van'

describe Van do
  it 'responds to collect_broken' do
    expect(subject).to respond_to(:collect_broken).with(1).argument
  end

  it 'collect_broken returns an array' do
    station = double { :station }
    expect(subject.collect_broken(station)).to be_kind_of(Array)
  end

  it 'expects to collect one broken bike' do
    bike = double("bike", :working? => false)
    station = double("station", :docks_bikes => bike, :bikes => [])
    station.docks_bikes(bike)
    subject.collect_broken(station)

    expect(subject.collect_broken(station)[][1]).to eq false
  end
end
