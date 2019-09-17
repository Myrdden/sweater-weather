class BaseController < Sinatra::Base
  get '/api/v1/forecast' do
    if params[:location]
      coords = GoogleService.geocode(params[:location])
      forecast = DarkskyService.get_forecast(coords)
      json BaseSerializer.darksky(forecast)
    else
      status 400
    end
  end

  get '/api/v1/background' do
    if params[:location]
      json BaseSerializer.wrap('background_image', [{url: UnsplashService.get_background(params[:location])}])
    else
      status 400
    end
  end

  get '/api/v1/road_trip' do

  end
end
