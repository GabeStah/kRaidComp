class Spec

  attr_accessor :class_spec, :count

  def initialize(attributes = {})
    @class_spec = attributes[:class_spec]
    @count = attributes[:count]
  end
end