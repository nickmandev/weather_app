require "weather_app/version.rb"
require 'json'
load 'city.list.json'

module WeatherApp
  attr_accessor :city, :city_id

    def initialize
        user_input
        define_city_id
        get_data
        parse_data
        user_output
    end

    def user_input
      puts "Enter the name of the city starting with capital letter"
      @city = STDIN.gets.chomp
    end

    def define_city_id
      file = File.read('/Users/nick/Developer/Projects/weather_app/lib/city.list.json')
      parsed_json = JSON.parse(file, symbolize_names: true)
        if parsed_json[:name] == @city
          @city_id = parsed_json[:_id]
        end

    end

    def get_data
      @city_id = ""
      api_key = "5250e2389b6cd6d131c5f4f825eafe6d"
      url = "http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&units=metric&APPID=#{api_key}"
      Net::HTTP.get(URI.parse(url))
    end

    def parse_data
      JSON.parse(get_data, symbolize_names: true)
    end

    def user_output
      data = parse_data
      print "The weather in #{data[:name]} is #{data[:weather][0][:description]} and the temperature is #{data[:main][:temp]} C"
    end
end

