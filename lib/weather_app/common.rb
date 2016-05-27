module WeatherApp
  class Common
    def get_data(city_id)
      units = WEATHER_APP_CONFIG['units']
      api_key = WEATHER_APP_CONFIG['api_key']
      url = "http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&units=#{units}&APPID=#{api_key}"
      api_response = Net::HTTP.get(URI.parse(url))
      raise "There's something wrong with the server! Try again later." unless Timeout::Error
      JSON.parse(api_response, symbolize_names: true)
    end

    def get_city_list
      path_to_file = File.join(WEATHER_APP_ROOT_PATH, '/assets/city.list.json')
      file = File.read(path_to_file)
      JSON.parse(file, symbolize_names: true)
    end
  end
end
