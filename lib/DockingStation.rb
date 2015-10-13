require_relative 'Bike'
class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bikes
    raise StandardError, "No Bike Available" unless @bikes.length > 0
    @bikes.pop
  end

  def docks_bikes(b)
    raise StandardError, "Station at Capacity" unless @bikes.length < 20
    @bikes.push(b)
  end

  def show
    @bikes.last
  end
end
