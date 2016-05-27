module WeatherApp
  class Terminal

    attr_accessor :city, :search_results, :user_response, :city_id, :common

    def start
      @common = Common.new
      request_user_input
      capitalize_user_input
      find_city_id
      process_search_results
    end

    def request_user_input
      puts "Enter the name of the city:"
      @city = STDIN.gets.chomp
    end

    def capitalize_user_input
      @city = @city.split.map(&:capitalize).join(" ")
      raise ArgumentError if @city.length == 0
    rescue
      puts "Can't leave the field blank!"
      start
    end

    def find_city_id
      @search_results = []
       @common.get_city_list.each do |val|
         if val[:name] == @city
           @search_results << val
         end
       end
      raise ArgumentError if @search_results.length == 0
    rescue
      puts "Can't find a city with that name.Check for typos!"
      start
    end
    def process_search_results
      if @search_results.length == 1
        single_result
      else
        multiple_results
      end
    end

    def single_result
      @city_id = @search_results[0][:_id]
      user_output
    end

    def multiple_results
      puts  "The results are:\n\n"
        @search_results.each_with_index do |val,index|
          print index + 1, ") #{val[:name]}, (#{val[:country]}) - #{val[:coord][:lat]},#{val[:coord][:lon]}\n\n"
        end
        print "Select the number associated to the city you want to check:"
        @user_response = gets.to_i
        @user_response = @user_response - 1
        @city_id = @search_results[@user_response][:_id]
        user_output
    end

    def user_output
      data = @common.get_data(@city_id)
      puts "The weather in #{data[:name]} is #{data[:weather][0][:description]} and the temperature is #{data[:main][:temp]} C"
      exit
    end
  end
end
