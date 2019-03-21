class Train

  attr_reader :cars_count, :speed, :type

  def initialize(number, type, cars_count)
    @number = number
    @type = type
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
    return unless speed.zero?
    @cars_count += 1
  end

  def remove_car
    return unless speed.zero?
    @cars_count -= 1 if @cars_count > 0
  end

  def set_route(route)
    @route = route
    @current_station = 0
    current_station.add_train(self)
  end

  def move_forward
    return unless next_station
    current_station.remove_train(self)
    @current_station += 1
    current_station.add_train(self)
  end

  def move_back
    return unless previous_station
    current_station.remove_train(self)
    @current_station -= 1
    current_station.add_train(self)
  end

  def next_station
    @route.stations[@current_station + 1]
  end

  def current_station
    @route.stations[@current_station]
  end

  def previous_station
    @route.stations[@current_station - 1] if @current_station > 0
  end

end
