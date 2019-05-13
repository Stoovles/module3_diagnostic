class StationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address, :fuel_types, :distance, :access_times
end
