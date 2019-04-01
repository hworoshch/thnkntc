class PassengerTrain < Train
  TRAIN_TYPE = 'Пассажирский'.freeze

  attr_reader :type, :number

  def initialize(number)
    super
    @type = 'passenger'
    validate!
  end

  def readable_type
    TRAIN_TYPE
  end

  def attachable_car?(car)
    car.is_a?(PassengerCar)
  end
end
