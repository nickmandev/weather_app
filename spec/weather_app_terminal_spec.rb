require 'spec_helper'

describe WeatherApp::Terminal do
  attr_accessor :terminal, :common

  describe "#new" do
    let(:terminal) {WeatherApp::Terminal.new}
    it 'returns Terminal object' do
      expect(terminal).to be_a WeatherApp::Terminal
    end
  end

  describe "#capitalize_user_input" do
    let(:terminal) {WeatherApp::Terminal.new}
    it 'should capitalize the user input' do
      terminal.city = 'santa sofia'
      expect(terminal.capitalize_user_input) == 'Santa Sofia'
    end
  end

  describe "#find_city_id" do
    let(:terminal) {WeatherApp::Terminal.new}
    it 'should parse json' do
      terminal.common = WeatherApp::Common.new
      terminal.city = "Sofia"
      terminal.find_city_id
      expect(terminal.search_results).not_to be_empty
    end
  end
end