use context starter2024
fun area(width :: Number,height :: Number) -> Number:
  doc: "Calculates area of a rectangle"
  width * height
end

fun tshirt-cost(
    num-shirts :: Number,
    message :: String)
  -> Number:
  doc:"Caculates total tshirt-cost for number of t-shirts plus the message"
  (num-shirts * 5) + (string-length(message) * 0.1)
  
end
tshirt-cost(4, "Go Team!")
tshirt-cost(7, "Hello World")