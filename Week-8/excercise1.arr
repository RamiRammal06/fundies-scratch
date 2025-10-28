use context starter2024

fun more-than-five(l):
  doc:"given a list of strings creates a new list that contains only elements with five+ characters"
  cases (List) l:
    |empty => empty
    |link(f, r) =>
     if string-length(f) > 5:
          link(f, more-than-five(r))
        else:
          more-than-five(r)
      end
  end
end

check:
  more-than-five(["bat", "banana", "took", "pineapple"]) is ["banana", "pineapple"]
  more-than-five(["hi", "world", "python", "Pyret"]) is ["python"]
  more-than-five([]) is []
end