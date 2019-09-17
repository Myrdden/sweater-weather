class BaseSerializer
  def self.wrap(type, attributes)
    {data: {
      id: '1',
      type: type,
      attributes: attributes
      }
    }
  end

  def self.darksky(forecast)
    {data: {
      id: '1',
      type: 'forecast',
      attributes: [
        forecast
        ]
      }
    }
  end
end
