use context dcic2024
include csv
include data-source
include table
#Flights table
flights = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: Number,
  tailnum :: Number,
  origin :: Number,
  dest :: Number,
  air_time,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time_hour :: Number
  source: csv-table-file("flights.csv",
  default-options)
  sanitize  rownames using num-sanitizer
  sanitize  dep_time using num-sanitizer
  sanitize  sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize  arr_time using num-sanitizer
  sanitize  sched_arr_time using num-sanitizer
  sanitize  arr_delay using num-sanitizer
  sanitize  flight using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize  hour using num-sanitizer
  sanitize  minute using num-sanitizer
end

