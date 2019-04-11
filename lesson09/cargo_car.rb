class CargoCar < Car
  CAR_TYPE = 'Грузовой'.freeze

  def readable_type
    CAR_TYPE
  end

  def type
    'cargo'
  end
end
