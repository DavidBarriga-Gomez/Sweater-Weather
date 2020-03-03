class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :type,
             :attributes,
             :location_name,
             :forecast,
             :summary,
             :current_temperature,
             :search_location
end
