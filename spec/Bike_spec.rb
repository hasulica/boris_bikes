require 'Bike'

describe Bike do
  it 'should respond to working?' do
    expect(subject).to respond_to :working?
  end

  it 'should respond to break' do
    expect(subject).to respond_to :break
  end

  it 'should have working state changed by break' do
    expect(subject.break).to eq false
  end
end
