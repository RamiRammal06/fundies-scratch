use context starter2024

fun choose-hat(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below nothing"
  if temp-in-C >= 27:
    "sun hat"
    if tem-in-C <= 10:
      "winter hat"
  else:
    "no hat"
  end
where:
  choose-hat(25) is "no hat"
  choose-hat(32) is "sun hat"
  choose-hat(27) is "sun hat"
  choose-hat(10) is "winter hat"
  choose-hat(0) is "winter hat"
end

fun mysterious-function(x)block:
  #First expression
  print("Inpute value is: " + num-to-string(x))
    #conditionals also produce expressions
  if x == 0:
      1
  else if x > 0:
      x * 2
    else:
      x * -1
    end
end