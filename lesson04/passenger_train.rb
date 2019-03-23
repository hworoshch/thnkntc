class PassengerTrain < Train

  attr_reader :type
  attr_reader :number

  def initialize(number)
    super
    @type = "passenger"
  end

end
