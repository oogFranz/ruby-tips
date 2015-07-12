arr = (0..999).map{|i| rand(80) }
count = Array.new(80,0)
arr.each{|c|
	count[c] = count[c] + 1
}
p count

1000000.times{	
	a = rand(0..999)
	b = rand(0..999)
	if (arr[a] > 0 && !arr[a].nil? && !arr[b].nil? ) then
		arr[a] -= 1
		arr[b] += 1
	end
}

arr.each{|c|
	if count[c].nil? then
		count[c] = 0
	end
	count[c] = count[c] + 1
}
p count
