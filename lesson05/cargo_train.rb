class CargoTrain < Train

  attr_reader :type, :number

  def initialize(number)
    super
    @type = "cargo"
  end

  def attachable_car?(car)
    car.is_a?(CargoCar)
  end

end
