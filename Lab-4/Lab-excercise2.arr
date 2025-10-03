use context dcic2024

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "Sword of Dawn",           23,  -87
  row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           78,  -56
  row: "Magic Staff",             -9,   64
  row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  -66,    5
  row: "Ring of Fire",            38,  -92
  row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          -29,  -21
end

adjusted-item-positions =
  transform-column(
    transform-column(items,
      "x-coordinate", lam(v): 0.9 * v end),
    "y-coordinate", lam(v): 0.9 * v end)
#Table adjust the x and y coords to be 10% closer to the player

closest-distance=
(order-by(items,
 lam(r): (r["x-coordinate"] * r["x-coordinate"]) +
 (r["y-coordinate"] * r["y-coordinate"]) end,
      num-ascending)
    closest-row = closest-distance.row-n(0)
   closest-item = closest-row["item"]