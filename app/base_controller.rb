class BaseController < Sinatra::Base
  get '/api/v1/forecast' do
    if params[:location]
      # json(RedisService.fetchex('SW:Forecast', 1800) do
        coords        = GoogleService.geocode(params[:location])
        forecast_data = DarkskyService.get_forecast(coords)
        forecast      = ForecastFacade.new(forecast_data, '')

        json BaseSerializer.darksky(forecast)
      # end)
    else
      status 400
    end
  end

  get '/api/v1/background' do
    if params[:location]
      # json(RedisService.fetchex('SW:Background', 1800) do
        background = ForecastFacade.new({}, UnsplashService.get_background(params[:location]))

        json BaseSerializer.background(background)
      # end)
    else
      status 400
    end
  end

  post '/api/v1/road_trip' do
    body = JSON.parse(request.body.read).symbolize_keys
    if body[:api_key] && User.validate(body[:api_key])
      # json(RedisService.fetchex('SW:RoadTrip', 1800) do
        travel_time   = GoogleService.travel_time(body)
        coords        = GoogleService.geocode(body[:destination])
        forecast_data = DarkskyService.get_forecast_time(coords, (Time.now.to_i + travel_time))
        forecast      = ForecastFacade.new(forecast_data, '')

        json BaseSerializer.darksky(forecast)
      # end)
    else
      status 403
    end
  end
end
