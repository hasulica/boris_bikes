require_relative 'Bike'
class DockingStation
  attr_reader :arr

  def initialize
    @arr = []
  end

  def release_bike
    raise StandardError, "No Bikes Available" unless @arr.length > 0
    @arr.pop
  end

  def docks_bike(b)
    raise StandardError, "Station at Capacity" unless @arr.length == 0
    @arr.push(b)
  end

  def show
    @arr.last
  end
end
