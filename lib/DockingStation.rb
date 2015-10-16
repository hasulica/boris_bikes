require_relative 'Bike'

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

  private
  def full?
    @bikes.length == @capacity
  end

  def empty?
    @bikes.any? ? false : true
  end

end
