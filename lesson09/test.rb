require_relative 'accessors'

class Test
  include Acсessors

  attr_accessor_with_history :my_attr
  strong_attr_accessor :test0, Class
end
