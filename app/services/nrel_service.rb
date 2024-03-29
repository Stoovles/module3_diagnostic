# frozen_string_literal: true

class NrelService

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def closest_station_by_zip_info
    get_json("api/alt-fuel-stations/v1/nearest.json?limit=15&location=#{@zip_code}&status=E&access=public&fuel_type=ELEC,LPG&api_key=JTlNqgAOrNQMGtZAZeJ1AOzWPcskJFS0AfJXUytc")
    #couldn't get ENV variable to work for nrel_api_key
  end


  private

  def get_json(_url)
    response = conn.get(_url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://developer.nrel.gov/') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
