require_relative 'Bike'
class DockingStation
  attr_reader :arr

  def initialize
    @arr = []
  end

  def release_bike
    Bike.new
  end

  def docks_bike(b)
    @arr.push(b)
  end

  def show
    @arr.last
  end 
end
