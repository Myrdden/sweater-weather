class AmypodeService
  AMYPODE_URL = 'http://amypode.herokuapp.com/api/v1'

  def self.antipode(lat, lng)
    response = Faraday.get("#{AMYPODE_URL}/antipodes") do |request|
      request.params['lat'] = lat
      request.params['long'] = lng
      request.headers['api_key'] = ENV['AMYPODE_API_KEY']
    end
    parse(response)[:data][:attributes]
  end

  private
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

