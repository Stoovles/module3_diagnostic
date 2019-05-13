class SearchFacade
attr_reader :user


  def following
    following_data.map do |following_data|
      Follower.new(following_data)
    end
  end

  private

    def closest_station_data
      @_nearest_station_data ||= service.closest_station_by_zip_info
    end


    def service
      @_service ||= NrelService.new
    end
end
