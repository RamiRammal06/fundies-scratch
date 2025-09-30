use context dcic2024
orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time, amount
  row: "08:00", 10.50
  row: "10:15", 8.00
end


fun is-morning(r :: Row) -> Boolean:
  doc: "checks if the row time is before morning"
  r["time"] < "12"
end


morning-orders = filter-with(orders, is-morning)

morning-orders2 = filter-with(orders, lam(r): r["time"] < "12" 
  end)

order-by(orders, "time", true)
  