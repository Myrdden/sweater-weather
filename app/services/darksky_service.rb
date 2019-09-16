class DarkskyService
  FORECAST_URL = "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}"

  def self.get_forecast(location)
    response = Faraday.get("#{FORECAST_URL}/#{location[:lat]},#{location[:lng]}")
    parse(response)
  end

  private
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
