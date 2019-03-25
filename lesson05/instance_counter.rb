module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@instances = 0

    def instances
      @@instances ||= 0
    end
  end

  module InstanceMethods
    @@instances = 0

    protected

    def register_instance
      @@instances += 1
    end
  end

end

