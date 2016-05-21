module WeatherApp
  class Common

    def get_data(city_id)
      api_key = configatron.api_key
      url = "http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&units=metric&APPID=#{api_key}"
      api_response = Net::HTTP.get(URI.parse(url))
      JSON.parse(api_response, symbolize_names: true)
    end

  end
end