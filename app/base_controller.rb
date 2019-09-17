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

  post '/api/v1/road_trip' do
    body = JSON.parse(request.body.read).symbolize_keys
    if body[:api_key] && User.validate(body[:api_key])
      travel_time = GoogleService.travel_time(body)
      coords = GoogleService.geocode(body[:destination])
      forecast = DarkskyService.get_forecast_time(coords, (Time.now.to_i + travel_time))
      json BaseSerializer.darksky(forecast)
    else
      status 403
    end
  end
end
