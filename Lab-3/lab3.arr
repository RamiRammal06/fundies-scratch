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

fun rock-paper-scissors(Player-1 :: String, Player-2 :: String)->String:
  doc:"determines who won rock paper scissors"
  if
    Player-1 == Player-2:
    "tie"
  else if 
    (Player-1 == "rock") and (Player-2 == "scissors"):
    "Player-1 wins"
  else if 
    (Player-1 == "paper") and (Player-2 == "rock"):
    "Player-1 wins"
  else if 
    (Player-1 == "scissors") and (Player-2 == "paper"):
    "Player-1 wins"
  else: 
    "Player-2 wins"
  end
where:
  rock-paper-scissors("rock","scissors") is
  "Player-1 wins"
  rock-paper-scissors("rock","paper") is
  "Player-2 wins"
  rock-paper-scissors("rock","rock") is
  "tie"
end
  
  