require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :name, :capacity, :hangar, :weather, :weather_status

  def initialize(name, capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @name = name
    @capacity = capacity
    @hangar = []
    @weather = weather
    weather.generate
    @weather_status = weather.status
  end

  def store(plane)
    fail "Hangar is at capacity" if full?
    fail "Cannot store plane that is in flight" if plane.in_flight
    fail "Plane already in hangar" if hangar.include?(plane)
    fail "Plane is currently at #{plane.current_location.name}" unless plane.current_location.nil?

    plane.update_location(self)
    hangar << plane
  end

  def release(plane)
    hangar.delete(plane)
    plane.update_location(nil)
  end

  def generate_new_weather
    @weather_status = weather.generate
  end

  private

  def full?
    hangar.count >= capacity
  end

end
