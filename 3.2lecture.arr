use context starter2024
include csv
include data-source

Plant = load-table:
  plant_common_name :: string,
  location_latitude :: number,
  location_longitude :: number,
  date_sighted :: number,
  soil_type :: string,
  plant_height_cm :: number,
  plant_color :: string
source:csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv",
  default-options)

end

