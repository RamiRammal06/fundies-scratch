use context starter2024
fun leap-year(y :: Number)-> Boolean:
  doc: "determines if it's a leap year"
   if 
    num-modulo(y,4) == 0:
    true
  else:
    false
  end
where:
  leap-year(2025) is false
  leap-year(2024) is true
end

fun tick(s :: Number)-> Number:
  doc: "determines the next second that comes after the current second"
  if
    s < 59:
    s + 1
  else: 
    0
  end
where:
  tick(59) is 0
  tick(58) is 59
end