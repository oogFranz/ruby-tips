def del(index)
	$arr[index] -= 1
	if $arr[index] == 0 then
		index2 = $hash[index].pop
		$hash[index2].delete(index)
		del(index2)
	end
end

n = gets.to_i
arr = Array.new(n).map{Array.new(n)}
arr1 = Array.new()

n.times{
	x,y = gets.split.map{|s| s.to_i() - 1}
	arr[x][y] = 1
	arr[y][x] = 1
	
	if $hash[x].nil? then
		$hash[x] = Array.new
	end
	if $hash[y].nil? then
		$hash[y] = Array.new
	end
	
	$hash[x].push(y)
	$hash[y].push(x)
}

loop{
	index = $arr.index(1)
	if index.nil? then
		break
	end
	del(index)
}
p $arr.count(2)