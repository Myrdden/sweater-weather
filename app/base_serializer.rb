class BaseSerializer
  def self.background(facade)
    {data: {
      id: '1',
      type: 'background',
      attributes: [
        {url: facade.background}
      ]
      }
    }
  end

  def self.darksky(facade)
    {data: {
      id: '1',
      type: 'forecast',
      attributes: [
        {lat: facade.lat,
         long: facade.long,
         currently: facade.currently,
         hourly: facade.hourly,
         daily: facade.daily
        }
      ]
      }
    }
  end
end
