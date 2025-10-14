use context starter2024
data Status:
  | todo
  | in-progress
  | done
end

data Priority:
  | low
  | medium
  | high
end

data Task:
  | task(description :: String, priority :: Priority, status :: Status)
  | note(description :: String)
end

fun describe(t :: Task) -> String:
  cases (Task) t:
    | task(d, p, s) =>
      priority = cases (Priority) p:
        | low => "❕TASK: "
        | medium => "❗️TASK: "
        | high => "‼️TASK: "
      end

      stat = cases (Status) s:
        | todo => " (🕒 To Do)"
        | in-progress => " (🚧 In Progress)"
        | done => " (✅ Done)"
      end

      priority + d + stat

    | note(d) => "📝 " + d
  end
end

data Tempature:
  | celcius(d) => d
  | farenheit(d) => (5/9) * (d-32)
  | kelvin(d) => d - 273.15
end
end

body-temp = kelvin(98)
to-celcius(body-temp)

fun to-celcius(t :: Temperature)-> Number:
  cases (