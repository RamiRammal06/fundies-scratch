use context dcic2024
include lists
include data-source
include csv
#students score table
student_score = load-table: 
  Name :: String,
  Surname :: String,
  Email :: String,
  Score :: Number
  source:csv-table-file("students_gate_exam_score.csv", default-options)
  sanitize Score using num-sanitizer
end
top_scores = order-by(student_score, "Score", false)

#Top 3 student scorers data
data Student:
    student(Name :: String, Surname :: String, Score :: Number)
end
s1 = student("Ethan", "Gray", 97)
s2 = student("Oscar", "Young", 92)
s3 = student("Adrian", "Bennett", 80)
#count how many of the top-3 students have scores greater than 90
fun over-90(scores :: List<Number>) -> Number:
  cases (List) scores:
    |  empty => 0
    |  link(first, rest) =>
      if first > 90:
        1 + over-90(rest)
      else: 
        over-90(rest)
      end
  end
end

      