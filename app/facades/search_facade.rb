class SearchFacade

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def closest_stations
    binding.pry
    closest_station_data.map do |station_data|
      StationSerializer.new(station_data)
    end
  end

  private

    def closest_station_data
      @_nearest_station_data ||= service.closest_station_by_zip_info
    end


    def service
      @_service ||= NrelService.new(@zip_code)
    end
end
