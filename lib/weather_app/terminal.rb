module WeatherApp
  class Terminal

    attr_accessor :city, :search_results

    def start
      request_user_input
      define_city_id
    end

    def request_user_input
      puts "Enter the name of the city:"
      @city = STDIN.gets.chomp
    end

    def define_city_id
      @search_results = []
      file = File.read('/Users/nick/Developer/Projects/weather_app/assets/city.list.json')
      parsed_json = JSON.parse(file, symbolize_names: true)
      parsed_json.each do |val|
        if val[:name] == @city
          @search_results << val
        end
      end
      @search_results.each do |data|
        puts  "The results are:\n\n"
        puts  " City: #{data[:name]}"
        puts  " Country: #{data[:country]}"
        puts  " Longitude: #{data[:coord][:lon]}"
        puts  " Latitude: #{data[:coord][:lat]}\n\n"
      end
    end

    def user_output
      common = Common.new
      data = common.get_data(@city_id)
      print "The weather in #{data[:name]} is #{data[:weather][0][:description]} and the temperature is #{data[:main][:temp]} C"
    end

  end
end