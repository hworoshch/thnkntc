class Route

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def stations
    @stations.each { |station| puts station.title }
  end

end
