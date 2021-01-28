class Plane

  attr_reader :current_location, :in_flight

  def initialize
    @current_location = nil
    @in_flight = false
  end

  def land(airport)
    fail "Cannot land a plane that is not in flight" unless in_flight
    fail "Cannot land in stormy weather" if airport.weather_status == :stormy
    
    @in_flight = false
    airport.store(self)
    "#{self} successfully landed at #{airport.name}"
  end

  def take_off
    fail "Plane is already in flight" if in_flight
    fail "Cannot take off in stormy weather" if current_location.weather_status == :stormy

    @in_flight = true
    airport_name = current_location.name
    current_location.release(self)
    "#{self} successfully took off from #{airport_name}"
  end

  def update_location(location)
    @current_location = location
  end

end
