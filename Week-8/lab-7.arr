use context starter2024
data SensorNet:
  | hub(bandwidth :: Number, left :: SensorNet, right :: SensorNet)
  | sensor(rate :: Number)
end

# Example network
sA = sensor(60)
sB = sensor(120)
sC = sensor(45)

# You can construct larger networks like:
hub1 = hub(150, sA, sB)
core = hub(200, hub1, sC)
hub2 = hub(250, sA, sC)

fun total-load(n :: SensorNet) -> Number:
  cases(SensorNet) n:
    |sensor(rate) => rate
    | hub(bandwidth,left, right) => total-load(left) + total-load(right)
  end
where:
  total-load(hub1) is 180
  total-load(core) is 225
end
      
fun fits-capacities(n :: SensorNet) -> Boolean:
  cases(SensorNet) n:
    | sensor(rate) => true
    | hub(bandwidth,left, right) => 
      block:
        total-load1 = total-load(left) + total-load(right) 
       fits-capacities(left) 
        and fits-capacities(right) and
        (bandwidth >= total-load1)
end
  end

where:
  fits-capacities(hub1) is false
  fits-capacities(hub2) is true
end

fun eepest-depth(n :: SensorNet) -> Number:
  cases(SensorNet) n:
    | sensor(rate) => 0
    | hub(bandwidth, left, right) => 