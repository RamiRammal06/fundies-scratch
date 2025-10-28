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

  
  
  fun my-len(l):
  cases (List) l:
    | empty => 0
    | link(f, r) => 1 + my-len(r)
  end
end

fun my-sum(l):
  cases (List) l:
    | empty => 0
    | link(f, r) => f + my-sum(r)
  end
end

# Calculates the average using my-sum and my-len
fun my-average(l):
  if l == empty:
    raise("Error: no average of an empty list")
  else:
    my-sum(l) / my-len(l)
  end
end