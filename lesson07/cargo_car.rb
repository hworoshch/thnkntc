class CargoCar < Car

  CAR_TYPE = "Грузовой"

  def readable_type
    CAR_TYPE
  end

  def type
    "cargo"
  end

end
