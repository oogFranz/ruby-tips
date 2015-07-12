coin = [500,100,50,10]
flag = false
loop{
	price = gets.chomp.to_i;
	if (price == 0) then
		break;
	end
	if flag then
		puts ""
	end
	flag = true
	arr = gets.split.map(&:to_i).reverse!
	
	amount = 0
	arr.each_index{|i|
		amount += arr[i] * coin[i]
	}
	last = amount - price
	
	lc = Array.new(4,0)
	
	coin.each_with_index{|c, i|
		lc[i] = last / c
		last -= lc[i] * c
	}
	lc.reverse!
	arr.reverse!
	
	coin.reverse.each_with_index{|c,i|
		if (arr[i] > lc[i]) then
			puts c.to_s + " " + (arr[i] - lc[i]).to_s			
		end
	}
}