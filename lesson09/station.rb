require_relative 'instance_counter'

class Station
  include InstanceCounter

  EMPTY_STATION_TITLE = 'Не указано название станции'.freeze

  attr_reader :trains, :title

  def self.all
    @all ||= []
  end

  def initialize(title)
    @title = title.to_s.strip
    validate!
    @trains = []
    register_instance
    self.class.all << self
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def each_train
    @trains.each do |train|
      yield(train)
    end
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def to_s
    title
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise ArgumentError, EMPTY_STATION_TITLE if @title.empty?
  end
end
