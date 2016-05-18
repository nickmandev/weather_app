require 'json'
module WeatherApp
  class Terminal

    attr_accessor :city

    def request_user_input
      puts "Enter the name of the city starting with capital letter"
      @city = STDIN.gets.chomp
    end

    def define_city_id
      file = File.read('/Users/nick/Developer/Projects/weather_app/assets/city.list.json')
      parsed_json = JSON.parse(file, symbolize_names: true)
      parsed_json.each do |val|
        if val[:name] == @city
          @city_id = val[:_id]
        end
      end
    end

    def user_output
      data = get_data
      print "The weather in #{data[:name]} is #{data[:weather][0][:description]} and the temperature is #{data[:main][:temp]} C"
    end

  end
end