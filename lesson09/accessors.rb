module Acсessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        var_history = "@#{name}_history".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}_history".to_sym) { instance_variable_get(var_history) }
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          instance_variable_set(var_history, []) unless instance_variable_defined?(var_history)
          instance_variable_get(var_history) << value
        end
        define_method("#{name}_history".to_sym) { instance_variable_get(var_history) }
      end
    end

    def strong_attr_accessor(name, attr_class)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        raise TypeError.new("неверный тип") unless value.is_a?(attr_class)
        instance_variable_set(var_name, value)
      end
    end

  end
end

