use context starter2024
fun area(width :: Number,height :: Number) -> Number:
  doc: "Calculates area of a rectangle"
  width * height
end
character-length=0.1
tshirt-basecost=5
fun tshirt-cost(
    num-shirts :: Number,
    message :: String)
  -> Number:
  doc:"Caculates total tshirt-cost for number of t-shirts plus the message"
  (num-shirts * tshirt-basecost) + (string-length(message) * character-length)
  
end
tshirt-cost(4, "Go Team!")
tshirt-cost(7, "Hello World")

fun celsius-to-farenheit(c :: Number) -> Number:
  doc:"Turns Celsius into farenheit"
  (c * (9 / 5)) + 32
end


check:
  celsius-to-farenheit(37.5) is (37.5 * (9 / 5)) + 32
end

fun farenheit-to-celsius(f :: Number) -> Number:
  doc:"Turns Farenheit into Celsius"
  (f - 32) * 5/9
end


check:
  farenheit-to-celsius(32) is 0
end