n,x =gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
x = x.to_s(2)
x.reverse!
ans = 0
x.split(//).each_with_index.map{|c,i|
	if c == '1'
		ans += a[i]
	end 
}
p ans