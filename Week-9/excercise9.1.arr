use context starter2024

data TaxonomyTree:
  node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end

# Example: Part of the cat family
lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felis catus", [list: ])
wildcat = node("Species", "Felis silvestris", [list: ])
felis = node("Genus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])


fun count-nodes(t :: TaxonomyTree) -> Number:
   1 + count-nodes-children(t.children)
where:
  count-nodes(lion) is 1
  count-nodes(panthera) is 4
  count-nodes(felis) is 3
  count-nodes(felidae) is 8
end

fun count-nodes-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-nodes(first) + count-nodes-children(rest)
  end
end

fun count-species(t):
  if t.rank == "Species":
    1 + c-s(t.children)  
  else:
    c-s(t.children)
  end
where:
  count-species(felidae) is 5
end

fun c-s(t):
  cases(List) t:
    | empty => 0
    | link(f, r) => count-species(f) + c-s(r)
  end
end


fun count-rank(t :: TaxonomyTree, r :: String) -> Number:
  if t.rank == r: 
    1 + count-rank-children(t.children, r)
  else:
    count-rank-children(t.children, r)
  end
where:
  count-rank(felidae, "Species") is 5
end

fun count-rank-children(lst :: List<TaxonomyTree>, r :: String) -> Number:
  cases (List) lst:
    | empty => 0
    | link(first, rest) =>
        count-rank(first, r) + count-rank-children(rest, r)
  end
end