require 'DockingStation'
describe DockingStation do

let(:bike) { double :bike }

  it 'responds to release bikes' do
    expect(subject).to respond_to :release_bikes
  end

  it 'releases working bikes' do
    bike = double("bike", :working? => "true")
    subject.docks_bikes(bike)
    expect(subject.release_bikes).to be_working
  end

  it 'docks bikes' do
    subject.docks_bikes(bike)
    expect(subject.bikes).to include(bike)
  end

  it 'shows docked bikes' do
    subject.docks_bikes(bike)
    expect(subject.show).to eq bike
  end

  it 'expects a No Bike Available error' do
    expect {subject.release_bikes}.to raise_error("No Bike Available")
  end

  it 'expects a Station at Capacity error' do
    DockingStation::DEFAULT_CAPACITY.times{subject.docks_bikes(bike)}
    expect {subject.docks_bikes(bike)}.to raise_error("Station at Capacity")
  end

  it 'initializing can take up to one argument' do
    d = DockingStation.new(10)
    expect(d.capacity).to eq 10
  end

  it 'defaults to a capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'expects two arguments' do
    expect(subject).to respond_to(:docks_bikes).with(1).arguments
  end

  it 'should not return broken bikes' do
    bike = double("bike", { working?: false, break: false })
    bike.break
    subject.docks_bikes(bike)
    expect { subject.release_bikes }.to raise_error("No working bikes available")

  end

end
