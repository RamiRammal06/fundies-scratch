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