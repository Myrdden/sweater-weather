class GoogleService
  GEOCODING_URL = 'https://maps.googleapis.com/maps/api/geocode/json'

  def self.geocode(location)
    response = Faraday.get(GEOCODING_URL) do |request|
      request.params['address'] = location
      request.params['key'] = ENV['GOOGLE_API_KEY']
    end
    parse(response)[:results][0][:geometry][:location]
  end

  def self.get_city(lat, lng)
    response = Faraday.get(GEOCODING_URL) do |request|
      request.params['key'] = ENV['GOOGLE_API_KEY']
      request.params['latlng'] = "#{lat},#{lng}"
    end
    parse(response)[:results][0][:address_components].find do |comp|
      comp[:types] = ['administrative_area_level_1', 'political']
    end[:long_name]
  end

  private
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
