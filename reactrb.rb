# Usage:
#   create a new ReactRB object that does not depend on anything:
#     ReactRB.new("some initial value")
#   create a new ReactRB object that depends on another ReactRB onject:
#     ReactRB.new.depends_on(a_dependancy, another_one) { |first, second| first + second }

class ReactRB
  def initialize(init_val = nil)
    @value = init_val
  end
  
  # Arguements:
  #   sources: Arguements which specify the ReactRB objects this object depends on.
  #   update_func: A block that will be called when you call the value method
  #                on the object, if it has dependancies.
  #                The sources will be passed in to the object, in order,
  #                so the arguements should match the sources Array, in order,
  #                and length.
  def depends_on(*sources, &update_func)
    @sources = sources
    @updater = update_func
    @value = nil
    return self
  end
  
  # Sets the value of the object to value, and sets the updating function to nil.
  # The class of the value passed must match the previous class
  def value=(value)
    if @value.class == value.class
      @value = value
      @updater = nil
    else
      raise "Class of new value (#{value.class}) does not match class of current value (#{@value.class})"
    end
  end
  
  # Returns the result of calling the updating block, or the value.
  def value
    return @updater.call(*@sources.map { |var| var.value }) if @updater
    return @value if @value
    raise "No value or updating block set"
  end
  
  def to_s
    return self.value.to_s
  end
end

# Quick Example
a = ReactRB.new(1)
b = ReactRB.new(2)
c = ReactRB.new.depends_on(a, b) do |var1, var2|
  var1 + var2**2
end
puts c #=> 5

a.value = 10
b.value = 5
puts c #=> 35