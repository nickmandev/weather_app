require "weather_app/version.rb"
require 'json'
require 'city.list.json'

module WeatherApp

  def self.user_input
    puts "Enter the name of the city starting with capital letter"
    city = STDIN.gets.chomp
  end

  def define_city_id
    file = JSON
  end

  def self.get_data
    city_id = "727011"
    api_key = "5250e2389b6cd6d131c5f4f825eafe6d"
    url = "http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&units=metric&APPID=#{api_key}"
    Net::HTTP.get(URI.parse(url))
  end

  def self.parse_data
    JSON.parse(get_data, symbolize_names: true)
  end

  def self.user_output
    data = self.parse_data
    print "The weather in #{data[:name]} is #{data[:weather][0][:description]} and the temperature is #{data[:main][:temp]} C"
  end
end


