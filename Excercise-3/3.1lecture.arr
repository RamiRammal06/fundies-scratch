use context starter2024

fun choose-hat(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below nothing"
 if temp-in-C >= 27:
    "sun hat"
  else if temp-in-C <= 10:
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
fun add-glasses(outfit :: String) -> String:
  doc:"adds glasses to whatever function choose-hat gives"
  outfit + ", and glasses"
where:
  add-glasses("winter hat") is "winter hat, and glasses"
end

fun choose-outfit(temp-in-C :: Number) -> String:
  doc: "picks an outfit based on temperature, then adds glasses no matter what"
  add-glasses(choose-hat(temp-in-C))
where:
  choose-outfit(25) is "no hat, and glasses"
  choose-outfit(32) is "sun hat, and glasses"
  choose-outfit(27) is "sun hat, and glasses"
  choose-outfit(10) is "winter hat, and glasses"
  choose-outfit(0)  is "winter hat, and glasses"
end


fun mysterious-function(x)block:
  #First expression
  print("Input value is: " + num-to-string(x))
    #conditionals also produce expressions
  if x == 0:
      1
  else if x > 0:
      x * 2
    else:
      x * -1
    end
end