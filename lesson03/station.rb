class Station

  attr_reader :trains, :title

  def initialize(title)
    @title = title
    @trains = []
  end

  def incoming_train(train)
    @trains << train
  end

  def outgoing_train(train)
    @trains.delete(train)
  end

  def cargo_trains
    @trains.select { |train| train.train_type == "cargo" }
  end

  def passenger_trains
    @trains.select { |train| train.train_type == "passenger" }
  end

end
