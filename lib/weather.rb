class Weather

  attr_reader :weather_types, :status

  def initialize(weather_types = [:sunny, :stormy])
    @status = nil
    @weather_types = weather_types
  end

  def generate
    @status = weather_types.sample
  end

end
