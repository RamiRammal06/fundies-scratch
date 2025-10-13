use context starter2024
import math as M
import statistics as S

responses = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]
discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]
 unique-codes = distinct(discount-codes)
fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = filter(is-real-code, unique-codes)
caps-codes = unique-codes.map(string-to-upper)

unique-response = distinct(responses)
lower-codes = unique-response.map(string-to-lower)
real-responses = [list: "yes", "no", "maybe"]
filter(lam(u): not(u == "maybe")
  end, 
  lower-codes)
fun products(number :: List)->Number block:
  var product = 1
  for each(n from number) :
    product := product * n
  end
  product
end


  
fun my-length(x :: List)-> Number block:
    var len = 0
  for each(n from x):
    len := len + 1
    end
    len
  end