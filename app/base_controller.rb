class BaseController < Sinatra::Base
  get '/api/v1/forecast' do
    if params[:location]
      coords        = GoogleService.geocode(params[:location])
      forecast_data = DarkskyService.get_forecast(coords)
      forecast      = ForecastFacade.new(forecast_data, '')

      json BaseSerializer.darksky(forecast)
    else
      status 400
    end
  end

  get '/api/v1/background' do
    if params[:location]
      background = ForecastFacade.new({}, UnsplashService.get_background(params[:location]))

      json BaseSerializer.background(background)
    else
      status 400
    end
  end

  post '/api/v1/road_trip' do
    body = JSON.parse(request.body.read).symbolize_keys
    if body[:api_key] && User.validate(body[:api_key])
      travel_time   = GoogleService.travel_time(body)
      coords        = GoogleService.geocode(body[:destination])
      forecast_data = DarkskyService.get_forecast_time(coords, (Time.now.to_i + travel_time))
      forecast      = ForecastFacade.new(forecast_data, '')

      json BaseSerializer.darksky(forecast)
    else
      status 403
    end
  end
end
