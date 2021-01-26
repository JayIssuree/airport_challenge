require_relative 'plane'

class Airport

  attr_reader :hangar, :name

  def initialize(name)
    @name = name
    @hangar = []
  end

  def store(plane)
    hangar << plane
  end

  def release(plane)
    hangar.delete(plane)
  end

end
