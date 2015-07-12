
1.upto(10){|j|
	n = j
	num = 10 ** n
	num.upto(num * 10){|i|
		if (i == (i*i % (num*10)))then
			print(i.to_s() + "\n")
		end
	}
}