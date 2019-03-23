class Station

  attr_reader :trains, :title

  def initialize(title)
    @title = title
    @trains = []
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

  def self.all
    @all ||= []
  end

end
