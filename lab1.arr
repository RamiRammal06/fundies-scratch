use context starter2024

include csv

voter-data =
  load-table: VoterID,DOB,Party,Address,City,County,Postcode
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end
#gets the date from a colum and switches the format
fun normalize-date(date :: String)->String:
  year = string-substring("12-05-1980", 6, 10)
  month = string-substring("12-05-1980", 3, 5)
  day = string-substring("12-05-1980", 0, 2)
year + "-" + month + "-" + day
end

transform-column(voter-data, "DOB", normalize-date)


#transforms postcode to be proper
fun normalize-postcode(post:: String)->String: 
  upper = string-to-upper(post)
  nospace = string-replace(upper, " ", "")
  llength = string-length(nospace)
  first = string-substring(nospace, 0, llength - 3)
  llast = string-substring(nospace, llength - 3, llength)
  first + " " + llast
end

normalize-postcode("sw177pf")
normalize-postcode("BN14QR")
normalize-postcode("LS14QN")