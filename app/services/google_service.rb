class GoogleService
  #https://maps.googleapis.com/maps/api/geocode/json?address=#{city},#{state}
  GEOCODING_URL = 'https://maps.googleapis.com/maps/api/geocode/json'

  def self.geocode(location)
    response = Faraday.get(GEOCODING_URL) do |request|
      request.params['address'] = location
      request.params['key'] = ENV['GOOGLE_API_KEY']
    end
    parse(response)[:results][0][:geometry][:location]
  end

  private
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
