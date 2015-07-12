w = gets.to_i
n,k = gets.split.map(&:to_i)
a = Array.new(n)
b = Array.new(n)
n.times{|i|
	a[i], b[i] = gets.split.map(&:to_i)
}
sum = b.inject(0){|sum,nn| sum + nn} 

dp = Array.new(k+1){Array.new(sum+1,10000000)}
dp[0][0] = 0
sum = 0
ans = 0

n.times{|i|
	[i,k-1].min.downto(0){|j|
		sum.downto(0){|l|
			dp[j+1][l+b[i]] = [dp[j+1][l+b[i]], dp[j][l] + a[i]].min
			if (ans < l+b[i] && dp[j+1][l+b[i]] <= w && j < k) then
				ans = l+b[i]
			end
		}
	}
	sum += b[i]
}

print ans
