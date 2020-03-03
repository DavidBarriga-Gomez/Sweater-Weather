class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :city, :location, :latitude_and_longitude
  # the properties that are going to be turned into json
  # in our case from our facade
end
