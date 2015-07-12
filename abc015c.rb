n,k = gets.split.map(&:to_i)
arr = Array.new(n).map{ Array.new(k) }
ind = Array.new(n,0)

n.times{|i|
	arr[i] = gets.split.map(&:to_i)
}

flag = true
loop{
	ans = 0
	ind.each_with_index{|n,i| ans ^= arr[i][n]}
	if ans == 0 then
		flag = false
		break
	end
	
	ind[n-1] += 1
	(n-1).downto(1){|i|
		if ind[i] == k then
			ind[i] = 0
			ind[i-1] += 1
		end
	}
	if ind[0] == k then
		break
	end
}

print flag ? "Nothing\n" : "Found\n"