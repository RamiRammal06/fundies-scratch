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
#functions checks to see if fligt disctance 1500 or greater
fun is-long-flight(row :: Row)-> Boolean:
doc: "Checks how long a flight is"
row["distance"] >= 1500
end
#filters out only flight 1500+
long_flight=filter-with(flights, is-long-flight)
#puts the long flights in order from greatest to least
flight-longest=order-by(long_flight,"air_time", false)
#shows only the longest flight
longest-flight= flight-longest.row-n(0)

#longest-flight["carrier"]
#longest-flight["origin"]
#longest-flight["dest"]
#checks for flights delayed 30+ minutes
fun is-delayed-departure(row :: Row)-> Boolean:
  doc:"finds delayed flight of 30 minutes or higher"
  row["dep_delay"] >= 30
end
#function checks for flights that leave after noon
fun is-morning-sched-dep(row :: Row)-> Boolean:
  doc:"checks if scheduled departure time is before noon"
  row["sched_dep_time"] < 1200
end
#checks shows flights delayed for 30+ minutes and is before noon
delayed_morning_flights= filter-with(filter-with(flights,lam(r): r["dep_delay"] >= 30 end), lam(r) : r["sched_dep_time"] < 1200 end)
#checks for 30m+ delayed flights, that are before noon, and are longer than 500 distance
delayed_morning_long_flights= 
filter-with(filter-with(filter-with(flights,lam(r): r["dep_delay"] >= 30 end), 
    lam(r) : r["sched_dep_time"] < 1200 end), 
  lam(r): r["distance"] > 500 end)