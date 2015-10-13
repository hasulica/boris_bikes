require 'DockingStation'
describe DockingStation do
  it 'responds to release bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'releases working bike' do
    bike = Bike.new
    subject.docks_bike(bike)
    expect(subject.release_bike).to be_working
  end

  it 'responds to docks_bike' do
    expect(subject).to respond_to(:docks_bike).with(1).argument
  end

  it 'docks bike' do
    bi = Bike.new
    subject.docks_bike(bi)
    expect(subject.arr).to include(bi)
  end

  it 'shows docked bike' do
    bi = Bike.new
    subject.docks_bike(bi)
    expect(subject.show).to eq bi
  end

  it 'expects a No Bikes Available error' do
    expect {subject.release_bike}.to raise_error("No Bikes Available")
  end

end
