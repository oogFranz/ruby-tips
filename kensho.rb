a = gets
a = a.to_i
b = gets.to_i
ans = (a % b)
if (ans == 0)
	p 0
else
	ans  =b -ans
	p ans
end