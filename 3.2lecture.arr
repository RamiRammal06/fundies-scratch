use context starter2024
include csv
include data-source

table: 
  plant:: string, 
  sighting-location :: strings, 
  Amount :: number, 
source:https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv

 row: r0c0, r0c1, ...
  row: r1c0, r1c1, ...
  row: r2c0, r2c1, ...
  ...
end

