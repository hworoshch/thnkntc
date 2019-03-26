module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
    base.instances = 0
  end

  module ClassMethods
    attr_accessor :instances

    def instances
      @instances ||= 0
    end
  end

  module InstanceMethods
    def register_instance
      self.class.instances += 1
    end
  end

end
