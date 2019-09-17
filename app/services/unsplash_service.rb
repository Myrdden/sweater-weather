class UnsplashService
  def self.get_background(location)
    response = Faraday.get('https://api.unsplash.com/photos/random') do |request|
      request.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
      request.params['orientation'] = 'landscape'
      request.params['location'] = "#{location} city"
    end
    parse(response)
  end

  private
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
