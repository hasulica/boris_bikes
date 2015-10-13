require_relative 'Bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bikes
    raise StandardError, "No Bike Available" unless !empty?
    @bikes.pop
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
    @bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @bikes.any? ? false : true
  end

end
