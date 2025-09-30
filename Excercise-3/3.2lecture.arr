use context dcic2024
include csv
include data-source
include table
#plant table
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

#glucose table
Glucose = load-table:
  patient_id :: string,
  glucose_level :: number,
  date_time :: string,
  insulin_dose :: number,
  exercise_duration :: number,
  stress_level :: number
  source:csv-table-file("glucose_levels.csv",
  default-options)
  sanitize  patient_id using num-sanitizer
  sanitize  glucose_level using num-sanitizer
  sanitize  insulin_dose using num-sanitizer
  sanitize  exercise_duration using num-sanitizer
  sanitize  stress_level using num-sanitizer
end

scatter-plot(Glucose, "glucose_level", "stress_level")
#shows graph with all glucose data