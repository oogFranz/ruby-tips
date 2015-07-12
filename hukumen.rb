class String
  def is_number?
    true if Integer(self) rescue false
  end
end

def getNumFromStr(str, map)
	num = 0
	str.each_char{|c|
		if c.is_number? then
			num = num * 10 +c.to_i
		elsif
			num = num *10 + map[c]
		end
	}
	return num
end

def getNum(arr, map)
	size = arr.size
	sum = 0
	(size-1).times{|i|
		sum += getNumFromStr(arr[i], map)
	}
	return (sum == getNumFromStr(arr[size-1], map))
end

def mapAdd(carr, map)
	ind = 0
	loop{
		map[carr[ind]] += 1
		if map[carr[ind]] == 10 then
			map[carr[ind]] = 0
			ind += 1
			if ind == carr.size then
				return false
			end
		else
			break
		end
	}
	return true
end

n = gets.to_i
problem = Array.new(n)

map = Hash.new()
carr = Array.new()
arr = Array.new()

n.times{|i|
	arr[i] = gets.chomp
	arr[i].each_char{|c|
		if (!map.key?(c) && !c.is_number?) then
			map[c] = 0
			carr.push(c)
		end
	}
}

loop{ 
	#if getNum(arr,map) then
	#	p map
	#end
	if !mapAdd(carr,map) then
		break
	end
}

