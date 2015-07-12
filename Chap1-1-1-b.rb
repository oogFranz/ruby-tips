str = gets.chomp
hash = {}
flag = true
str.chars{|c|
	if (hash.has_key?(c)) then
		flag = false
		break;
	else
		hash[c] = 1
	end
}
puts flag