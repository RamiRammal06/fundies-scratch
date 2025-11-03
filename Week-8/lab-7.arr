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

fun deepest-depth(n :: SensorNet) -> Number:
  cases(SensorNet) n:
    | sensor(rate) => 0
    | hub(bandwidth, left, right) => 
      1 + num-max(deepest-depth(left), deepest-depth(right))
  end
where:
  deepest-depth(hub1) is 1
  deepest-depth(core) is 2
end

fun needed-scale(n :: SensorNet) -> Number:
  cases (SensorNet) n:
    | sensor(rate)  => 1
    | hub(bw, l, r) =>
      block:
        load = total-load(l) + total-load(r)
        here = load / bw
        num-max( num-max(here, needed-scale(l)), needed-scale(r) )
      end
  end
where:
  # For 'core': max(225/200 = 1.125, hub1: 180/150 = 1.2) = 1.2
  needed-scale(core) is 1.2
end

fun apply-scale(n :: SensorNet, s :: Number) -> SensorNet: 
  cases(SensorNet) n:
    | sensor(rate) => sensor(rate / s)
    | hub(bandwidth, left, right) => 
      hub(bandwidth, apply-scale(left,s), apply-scale(right,s))
  end
where:
   total-load(apply-scale(core, 1.2)) is 187.5
total-load(apply-scale(core, 1.5)) is 150
end