n =gets.to_i()
arr = Array.new(1000002,0) 
n.times{|i|
	a = gets.split.map(&:to_i)
	arr[a[0]] += 1
	arr[a[1] +1] -=1
}

ans = 0
tmp = 0
arr.each{|i|
	tmp += i
	if ans < tmp 
		ans = tmp
	end
}
p ans