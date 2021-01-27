require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :name, :capacity, :hangar

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @hangar = []
  end

  def store(plane)
    fail "Hangar is at capacity" if full?

    plane.update_location(self)
    hangar << plane
  end

  def release(plane)
    hangar.delete(plane)
    plane.update_location(nil)
  end

  private

  def full?
    hangar.count >= capacity
  end

end
