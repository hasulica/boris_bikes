require_relative 'Bike'
class DockingStation

  def initialize
    @arr = []
  end

  def arr
    @arr
  end

  def release_bike
    Bike.new
  end

  def docks_bike(b)
    @arr.push(b)
  end
  
end
