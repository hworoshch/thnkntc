require_relative 'instance_counter'

class Route

  include InstanceCounter

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
    puts "St #{start_station}"
    puts "En #{end_station}"
    raise ArgumentError, "Не указана начальная станция" if start_station.empty?
    raise ArgumentError, "Не указана конечная станция" if end_station.empty?
  end

end
