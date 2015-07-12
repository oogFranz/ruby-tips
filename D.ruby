n =gets.to_i()
b = Array.new(n).map{Array.new(n,n+100)}

(n-1).times{|i|
	a = gets.split.map(&:to_i)
	b[a[0]-1][a[1]-1] = 1
	b[a[1]-1][a[0]-1] = 1
	
	b[i][i] = 0
}
b[n-1][n-1] = 0

n.times{|k|
	n.times{|i|
		n.times{|j|
		
		}
	}
}

q =gets.to_i()
q.times{|i|
	
}