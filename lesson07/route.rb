require_relative 'instance_counter'

class Route

  include InstanceCounter

  EMPTY_START_STATION = "Не указана начальная станция"
  EMPTY_END_STATION = "Не указана конечная станция"

  attr_reader :stations

  def self.all
    @all ||= []
  end

  def initialize(start_station, end_station)
    validate!(start_station, end_station)
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

  def to_s
    [stations.first.title, stations.last.title].join(' - ')
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!(start_station, end_station)
    raise ArgumentError, EMPTY_START_STATION if start_station.nil?
    raise ArgumentError, EMPTY_END_STATION if end_station.nil?
  end

end
