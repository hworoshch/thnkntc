class PassengerCar < Car

  CAR_TYPE = "Пассажирский"

  def readable_type
    CAR_TYPE
  end

  def type
    "passenger"
  end

end
