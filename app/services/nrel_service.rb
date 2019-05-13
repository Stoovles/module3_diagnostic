# frozen_string_literal: true

class NrelService

  def initialize(nrel_token)
    @nrel_token = nrel_token
  end

  def closest_train_by_zip_info
    get_json('api/alt-fuel-stations/v1/nearest.json?parameters')
    #parameters to be filled in
  end


  private

  def get_json(_url)
    response = conn.get(_url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://developer.nrel.gov/') do |f|
      f.adapter Faraday.default_adapter
      f.authorization :Bearer, @nrel_token
    end
  end
end
