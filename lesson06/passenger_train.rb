class PassengerTrain < Train

  attr_reader :type, :number

  def initialize(number)
    super
    @type = "passenger"
    validate!
  end

  def attachable_car?(car)
    car.is_a?(PassengerCar)
  end
  
end
