class Plane

  attr_reader :current_location

  def initialize
    @current_location = nil
  end

  def land(airport)
    airport.store(self)
    "#{self} successfully landed at #{airport.name}"
  end

  def take_off
    airport_name = current_location.name
    current_location.release(self)
    "#{self} successfully took off from #{airport_name}"
  end

  def update_location(location)
    @current_location = location
  end

end