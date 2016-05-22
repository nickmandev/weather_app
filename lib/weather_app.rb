require "yaml"
require 'json'
require "weather_app/version.rb"
require 'weather_app/common.rb'
require 'weather_app/terminal.rb'

module WeatherApp
  unless defined? WEATHER_APP_ROOT_PATH
    WEATHER_APP_ROOT_PATH = File.dirname(File.dirname(__FILE__))
  end
  unless defined? WEATHER_APP_CONFIG
    WEATHER_APP_CONFIG = YAML.load_file(File.join(WEATHER_APP_ROOT_PATH,'/config/weather_app.yml'))
  end
end
