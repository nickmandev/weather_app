module WeatherApp
  class Common
    def get_data(city_id,type_forecast)
      # set 'type_forecast' to the type of forecast you want check 'http://openweathermap.org' for more info
      retries = 0
      begin
      units = WEATHER_APP_CONFIG['units']
      api_key = WEATHER_APP_CONFIG['api_key']
      url = "http://api.openweathermap.org/data/2.5/#{type_forecast}?id=#{city_id}&units=#{units}&APPID=#{api_key}"
      api_response = Net::HTTP.get(URI.parse(url))
      raise Timeout::Error if Timeout::Error
      JSON.parse(api_response, symbolize_names: true)
      rescue Timeout::Error
        if retries < 3
          puts "Timeout - Retrying..."
          retries += 1
          retry
        else
          puts "Failed after 3 retries. Try again later."
          exit(1)
        end
      end
    end

    def get_city_list
      path_to_file = File.join(WEATHER_APP_ROOT_PATH, '/assets/city.list.json')
      file = File.read(path_to_file)
      JSON.parse(file, symbolize_names: true)
    end
  end
end
