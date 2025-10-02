use context dcic2024
include csv
include data-source
include tables

photos = load-table:
  Location :: String,
  Subject :: String,
  Date :: String
  source: csv-table-url(
    "https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/photos.csv",
    default-options)
end

# filters subjects called Forest
forest-photos = filter-with(photos, lam(r): r["Subject"] == "Forest" end)

# order by latest to earliest
forest-sorted = order-by(forest-photos, "Date", true)

# extracts Location of the most recent photo
latest-forest-location = forest-sorted.row-n(0)["Location"]

# counts how many photos are in each Location
location-counts = count(photos, "Location")

# order locations by most photos first
location-counts-sorted = order-by(location-counts, "count", true)

# frequency bar chart of Location column
chart = freq-bar-chart(photos, "Location")