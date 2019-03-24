class Car

  attr_accessor :train

  def initialize
    @attached = false
  end

  def attached!
    @attached = true
  end

  def attached?
    @attached
  end

end
