require_relative 'vendor'

class Car

  include Vendor

  def initialize
    @attached = false
  end

  def attached?
    @attached
  end

  def attached!
    @attached = true
  end

  def detached!
    @attached = false
  end

end
