class Plane

  attr_reader :current_location

  def initialize
    @current_location = nil
  end

  def land(airport)
    airport.store(self)
    @current_location = airport
    "#{self} successfully landed at #{airport.name}"
  end

  def take_off
    current_location.release(self)
    airport_name = current_location.name
    @current_location = nil
    "#{self} successfully took off from #{airport_name}"
  end

end
