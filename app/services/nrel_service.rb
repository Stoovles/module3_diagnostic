# frozen_string_literal: true

class NrelService

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def closest_station_by_zip_info
    get_json("api/alt-fuel-stations/v1/nearest.json?location=#{@zip_code}")
    #parameters to be filled in - this should be dynamic based on search params
  end


  private

  def get_json(_url)
    response = conn.get(_url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://developer.nrel.gov/') do |f|
      f.adapter Faraday.default_adapter
      f.basic_auth(ENV["NREL_API_KEY"], '')
    end
  end
end
