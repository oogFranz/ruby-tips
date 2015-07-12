
str = gets
arr =[]

#二分木
flag = true
str.chars{|c|
	i = 1
	while true do
		if (arr[i].nil?) then
			arr[i] = c
			break
		end
		if (arr[i] == c) then
			flag = false
			break;
		end
		if (arr[i] > c) then
			i = i * 2
		else
			i = i *2 +1
		end
	end
	
	if (!flag) then
		break
	end
	p arr
	
}

puts flag