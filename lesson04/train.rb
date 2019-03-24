class Train

  attr_reader :speed, :number, :cars

  def initialize(number)
    @number = number
    @cars = []
    @speed = 0
    self.class.all << self
  end

  def accelerate(speed = 5)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def add_car(car)
    return unless speed.zero? 
    return unless attachable_car?(car)
    return if car.attached?
    @cars << car
    car.attached!
  end

  def remove_car(car)
    return unless speed.zero?
    car.train = nil
    @cars.delete(car)
    car.detached!
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

  def self.all
    @@all ||= []
  end

  def to_s
    [type.capitalize, number].join(' ')
  end

  protected

  # следующие методы не осуществляют вывод и не используются для управления извне, следовательно их можно отгородить

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
