module WeatherApp
  class Terminal

    attr_accessor :city, :search_results, :user_response, :city_id

    def start
      request_user_input
      define_city_id
      select_response
      user_output
    end

    def request_user_input
      puts "Enter the name of the city:"
      @city = STDIN.gets.chomp
      @city = @city.split.map(&:capitalize).join(" ")
    end

    def define_city_id
      common = Common.new
      @search_results = []
      common.get_city_list.each do |val|
        if val[:name] == @city
          @search_results << val
        end
      end
      puts  "The results are:\n\n"
      @search_results.each_with_index do |val,index|
        puts    index + 1
        puts  " City: #{val[:name]}"
        puts  " Country: #{val[:country]}"
        puts  " Longitude: #{val[:coord][:lon]}"
        puts  " Latitude: #{val[:coord][:lat]}\n\n"
      end
    end

    def select_response
      print "Select the number associated to the city you want to check:"
        @user_response = gets.to_i
        @user_response = @user_response - 1
        @city_id = @search_results[@user_response][:_id]

    end

    def user_output
      common = Common.new
      data = common.get_data(@city_id)
      puts "The weather in #{data[:name]} is #{data[:weather][0][:description]} and the temperature is #{data[:main][:temp]} C"
    end

  end
end
