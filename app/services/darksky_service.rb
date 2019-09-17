class DarkskyService
  FORECAST_URL = "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}"

  def self.get_forecast(coords)
    response = Faraday.get("#{FORECAST_URL}/#{coords[:lat]},#{coords[:lng]}")
    parse(response)
  end

  def self.get_forecast_time(coords, timestamp)
    response = Faraday.get("#{FORECAST_URL}/#{coords[:lat]},#{coords[:lng]},#{timestamp}")
    parse(response)
  end

  private
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
