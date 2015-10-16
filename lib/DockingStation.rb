require_relative 'Bike'
require_relative 'Van'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bikes

    raise StandardError, "No Bike Available" unless !empty?

    @bikes.each do |bike|
      if bike.working?
        return @bikes.delete(bike)
      end
    end
    raise StandardError, "No working bikes available"
  end

  def docks_bikes(b)
    raise StandardError, "Station at Capacity" unless !full?
    @bikes.push(b)
  end

  def show
    @bikes.last
  end

  def broken_bikes
    broken_bikes = []
    @bikes.each do |bike|
      if bike.working? == false
        broken_bikes << bike
      end

    end
    broken_bikes
  end

  private
  def full?
    @bikes.length == @capacity
  end

  def empty?
    @bikes.any? ? false : true
  end

end
