n = gets.to_i
arr = gets.split.map(&:to_i)
sum = arr.inject(0.0){|sum,n|sum+n}
count = arr.count{|n| n != 0}

print (sum/count).ceil