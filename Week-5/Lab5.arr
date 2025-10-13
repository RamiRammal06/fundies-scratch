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
  source: csv-table-file("flights_sample53.csv",
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

Unknown_tailnum = transform-column(flights, "tailnum",
  lam(v):
    if (v) == "":
      "UNKNOWN"
    else:
      v
    end
  end)

#Replace negative delays with 0
deps_delay = transform-column(flights, "dep_delay",
  lam(v):
    if v < 0:
      0
    else:
      v
    end
  end)

arrs_delay = transform-column(flights, "arr_delay",
  lam(v):
    if v < 0:
      0
    else:
      v
    end
  end)

# Trim spaces at both ends
fun trim(s :: String) -> String:
  doc: "Remove spaces from the given string."
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s, " ", "")
  end
end


#
flights2 = build-column(flights, "dup_key",
  lam(r):
    num-to-string(r["flight"]) + "-" +
    string-to-upper(trim(r["carrier"])) + "-" +
    num-to-string(r["dep_time"])
  end)