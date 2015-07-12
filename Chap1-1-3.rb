#O(n^2)での解法
#文字列検索を使用
def func_index(string1, string2)
	if (string1.length != string2.length) then
		return false
	end
	
	string1.chars{|c|
		pos = string2.index(c)
		if (pos.nil?) then
			return false
		end
		string2.slice!(pos)
	}
	return string2 ==''
end

#O(nlogn}での解放
#ソートして調べる。
def func_sort(string1, string2)
	if (string1.length != string2.length) then
		return false
	end
	arr1 = string1.split('').sort.join('')
	arr2 = string2.split('').sort.join('')
	return arr1 == arr2
end

#O(n)での解法
#ハッシュ（連想配列）を使用
def func_hash(string1, string2)
	if (string1.length != string2.length) then
		return false
	end
	
	hash = Hash.new(0)
	string1.chars{|c|
		hash[c] += 1
	}
	string2.chars{|c|
		if hash[c] < 1 then
			return false
		end
		hash[c] -= 1
	}
	return true
end


string1,string2 = gets.split
puts func_sort(string1,string2)