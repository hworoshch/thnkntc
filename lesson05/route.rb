require_relative 'instance_counter'

class Route

  include InstanceCounter

  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    self.class.all << self
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    return if [@stations.first, @stations.last].include?(station)
    @stations.delete(station)
  end

  def show_stations
    @stations.each { |station| puts station.title }
  end

  def self.all
    @all ||= []
  end

  def to_s
    [stations.first.title, stations.last.title].join(' - ')
  end

end
