use context starter2024
include csv
include data-source
include table
#plant table
#forest table
Plant = load-table:
  plant_common_name :: string,
  location_latitude :: number,
  location_longitude :: number,
  date_sighted :: number,
  soil_type :: string,
  plant_height_cm :: number,
  plant_color :: string
source:csv-table-url("include data-source
#plant table
Plant = load-table:
  plant :: string,
  location_latitude :: number,
  location_longitude :: number,
  date_sighted :: number,
  soil_type :: string,
  plant_height_cm :: number,
  plant_color :: string
source:csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv",
  default-options)",
  default-options)
