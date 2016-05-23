require 'spec_helper'

describe WeatherApp::Terminal do
  attr_accessor :terminal, :city
  before :each do
    @terminal = WeatherApp::Terminal.new
  end

  describe "#new" do
    it 'returns Terminal object' do
      expect(@terminal).to be_a WeatherApp::Terminal
    end
  end

  describe "#capitalize_user_input" do
    it 'should capitalize the user input' do
      @terminal.city = 'santa sofia'
      expect(@terminal.capitalize_user_input) == 'Santa Sofia'
    end
  end

end