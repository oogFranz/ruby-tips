n = gets.to_i
x,y = gets.split.map{|i| i.to_i() -1}
arr = []
arr2 =[]

n.times{|i|
	arr.each_with_index{|num,j|
		arr2[j] = arr[j]
		if j != 0	then
			if i == x and y == j then
				arr2[j] = (arr2[j] - arr[j-1]).abs
			else
				arr2[j] += arr[j-1]
			end
		end
		
	}
	arr = arr2 + [1]
	arr2 +=  [1]
	print arr2.join(" ") + "\n"
	
}