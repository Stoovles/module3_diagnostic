class SearchFacade


  def initialize(zip_code)
    @zip_code = zip_code
  end

  def closest_stations
    closest_station_data[:fuel_stations].map do |station_data|
      Station.new(station_data, closest_station_data[:total_results])
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
