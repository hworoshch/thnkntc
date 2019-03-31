require_relative 'vendor'

class Car

  include Vendor

  NOT_ENOUGH_SPACE = "Недостаточно свободного места"

  attr_reader :occupied

  def self.all
    @@all ||= []
  end

  def self.all_detached
    @@all.select { |car| car.attached? == false }
  end

  def initialize(capacity)
    @capacity = capacity
    @occupied = 0
    @attached = false
    self.class.all << self
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

  def occupy(volume)
    raise NOT_ENOUGH_SPACE if volume > vacant
    @occupied += volume 
  end

  def vacant
    @capacity - @occupied
  end

end
