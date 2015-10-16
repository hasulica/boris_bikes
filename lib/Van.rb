
class Van
  def collect_broken(docking_station)
    @broken = []
    docking_station.bikes.each do |bike|
       if bike.working? == false
         @broken << bike
       end
     end
     @broken
  end
end
