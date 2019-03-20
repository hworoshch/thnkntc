class Train

  attr_reader :cars_count, :speed, :train_type

  def initialize(number, train_type, cars_count)
    @number = number
    @train_type = train_type
    @cars_count = cars_count
    @speed = 0
  end

  def accelerate(speed = 5)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def add_car
    stop
    @cars_count += 1
  end

  def remove_car
    stop
    @cars_count -= 1
  end

  def set_route(route)
    @route = route
    @stations = route.stations
    @stations.first.incoming_train(self)
    @current_station = 0
    puts @stations[@current_station]
  end

  def move_forward
    if @current_station < @stations.size - 1
      @stations[@current_station].outgoing_train(self)
      @current_station += 1
      @stations[@current_station].incoming_train(self)
    end
  end

  def move_back
    if @current_station > 0
      @stations[@current_station].outgoing_train(self)
      @current_station -= 1
      @stations[@current_station].incoming_train(self)
    end
  end

  def next_station
    @stations[@current_station + 1] if @current_station < @stations.size - 1
  end

  def current_station
    @stations[@current_station]
  end

  def previous_station
    @stations[@current_station - 1] if @current_station > 0
  end

end
