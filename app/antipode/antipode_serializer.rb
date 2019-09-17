class AntipodeSerializer
  def self.build(name, forecast, search)
    {data: [
        {id: '1',
         type: 'antipode',
         attributes: {
           location_name: name,
           forecast: {
             summary: forecast[:currently][:summary],
             current_temperature: forecast[:currently][:temperature]
           },
           search_location: search
          }
        }
      ]
    }.to_json
  end
end
