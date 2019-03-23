class CargoTrain < Train

  attr_reader :type
  attr_reader :number

  def initialize(number)
    super
    @type = "cargo"
  end

end
