require_relative 'instance_counter'

class Station

  include InstanceCounter

  attr_reader :trains, :title

  def self.all
    @all ||= []
  end

  def initialize(title)
    @title = title
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

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def to_s
    title
  end

end
