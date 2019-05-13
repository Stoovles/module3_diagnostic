class Station
  attr_reader :station_name, :access_days_time, :fuel_type_code, :distance, :street_address
  def initialize(data, total_results)
    @station_name = data[:station_name]
    @access_days_time = data[:access_days_time]
    @fuel_type_code  = data[:fuel_type_code]
    @distance = data[:distance]
    @street_address = data[:street_address]
  end
end
