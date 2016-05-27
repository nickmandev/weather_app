require 'spec_helper'

describe WeatherApp::Common do
  describe  "#new" do
    attr_accessor :common
    let(:common) {WeatherApp::Common.new}
    it 'return Common object' do
      expect(common).to be_a WeatherApp::Common
    end
  end

  describe "#get_data" do
    let(:common) {WeatherApp::Common.new}
    it 'expect to get data from URL and parse JSON' do
      common.get_data(727011)
      _expected = {key: 'details'}.to_json
        expect(common.get_data(727011)) == _expected
    end
  end

  describe "#get_data" do
    let(:common) {WeatherApp::Common.new}
    it 'check if JSON parse return valid data' do
      common.get_data(727011).include?(:weather)
    end
  end

  describe "#get_data" do
    let(:common) {WeatherApp::Common.new}
    it 'expect to fail without city_id' do
      common.get_data(value)
    end
  end

  describe "#get_city_list" do
    let(:common) {WeatherApp::Common.new}
    it 'expect to parse JSON' do
      common.get_city_list
      _expected = {key: 'value'}.to_json
        expect(common.get_city_list) == _expected
    end
  end
end