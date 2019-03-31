class CargoTrain < Train

  TRAIN_TYPE = "Грузовой"

  attr_reader :type, :number

  def initialize(number)
    super
    @type = "cargo"
    validate!
  end

  def readable_type
    TRAIN_TYPE
  end

  def attachable_car?(car)
    car.is_a?(CargoCar)
  end

end
