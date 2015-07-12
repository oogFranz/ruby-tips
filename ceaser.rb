str, n = gets.split
n = n.to_i
puts str.codepoints.map{|c| 
	((c - 'a'.ord + n) % 26 + 'a'.ord).chr
}.join()
