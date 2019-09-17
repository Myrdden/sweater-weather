class GoogleService
  GEOCODING_URL = 'https://maps.googleapis.com/maps/api/geocode/json'
  DIRECTIONS_URL = 'https://maps.googleapis.com/maps/api/directions/json'

  def self.geocode(location)
    response = Faraday.get(GEOCODING_URL) do |request|
      request.params['key'] = ENV['GOOGLE_API_KEY']
      request.params['address'] = location
    end
    parse(response)[:results][0][:geometry][:location]
  end

  def self.travel_time(route)
    response = Faraday.get(DIRECTIONS_URL) do |request|
      request.params['key'] = ENV['GOOGLE_API_KEY']
      request.params['origin'] = route[:origin]
      request.params['destination'] = route[:destination]
    end
    parse(response)[:routes][0][:legs][0][:duration][:value]
  end

  private
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
