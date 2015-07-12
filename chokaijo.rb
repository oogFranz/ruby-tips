N = 4

cnt = 0
i = 2
while(i<=N) do
	i*=2
	cnt += 1
end


ans = 0
cnt.times{|i|
	m = N / (2^i)
	
}


2.step(n,2){|i|
	c = 0
	j = i
	while(j%2 == 0) do
		j /= 2
		c += 1
	end
	ans += (n-i+1)*c
}

p ans
