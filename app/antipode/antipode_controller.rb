class AntipodeController < Sinatra::Base
  get '/api/v1/antipode' do
    loc = GoogleService.geocode(params[:loc])
    antipode = AmypodeService.antipode(loc[:lat], loc[:lng])
    antipode_city = GoogleService.get_city(antipode[:lat], antipode[:long])
    antipode_weather = DarkskyService.get_forecast({lat: antipode[:lat], lng: antipode[:long]})
    json AntipodeSerializer.build(antipode_city, antipode_weather, params[:loc])
  end
end
