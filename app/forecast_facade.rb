class ForecastFacade
  attr_reader :lat, :long, :currently, :hourly, :daily, :background
  def initialize(data, background_url)
    @lat = data[:latitude]
    @long = data[:longitude]
    @currently = data[:currently]
    @hourly = data[:hourly]
    @daily = data[:daily]
    @background = background_url
  end
end
