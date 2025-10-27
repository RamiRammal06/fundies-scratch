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
order-by(student_score, Score, true)