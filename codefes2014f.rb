def del(index)
	if $arr[index] == 0 then
		index2 = -1
		loop{
			index2 = $hash[index].pop
			if $arr[index2] > 0 then
				break
			end
		}
		$arr[index2] -= 1
		if $arr[index2] == 1 then
			$arr_edge.push(index2)
		end
		del(index2)
	end
end

n = gets.to_i
$arr = Array.new(n,0)
$hash = Hash.new()
$arr_edge = Array.new()

n.times{
	x,y = gets.split.map{|s| s.to_i() - 1}
	$arr[x] += 1
	$arr[y] += 1
	
	if $hash[x].nil? then
		$hash[x] = Array.new
	end
	if $hash[y].nil? then
		$hash[y] = Array.new
	end
	
	$hash[x].push(y)
	$hash[y].push(x)
}

$arr.each_with_index{|i,index|
	if i == 1 then
		$arr_edge.push(index)
	end
}

loop{
	if $arr_edge.empty? then
		break
	end
	index = $arr_edge.pop

	$arr[index] -= 1
	del(index)
}
p $arr.count(2)