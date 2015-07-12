#ワンライナー(80文字)。小文字しか入力がないものとする。
#p 1<<32>gets.split('').map{|c|1<<(c.ord-97)}.inject(0){|v,c|v|=(v&c)<1?c:1<<32}

#O(n)での解法
#ハッシュ（連想配列）を使用
def fact_hash(string)
	hash = {}
	flag = true
	string.chars{|c|
		if (hash.has_key?(c)) then
			flag = false
			break;
		else
			hash[c] = 1
		end
	}
	return flag
end

#O(n)での解法
#ビットベクトルを使用
#小文字しか入力がないものとする。
def fact_bit(string)
	vec = 0;
	flag = true
	string.chars{|c|
		elem = 1 << (c.ord - 'a'.ord)
		if ((vec & elem) != 0) then
			flag = false
			break;
		else
			vec = vec | elem
		end
	}
	return flag
end


#ここから新たなデータ構造が使えない場合


#O(nlogn)の解法
#ソートして調べる
def fact_sort(string)
	arr = string.split('').sort
	tmp = ''
	arr.each{|elem|
		if (tmp == elem)then
			return false
		end
		tmp = elem
	}
	return true
end

#O(nlogn)での解法
#少しでも無駄を省きたい場合
#再帰的に調べる。

def fact_rec(string)
	if (string.length <= 1) then
		return true
	end
	
	pivot = string.slice!(0)
	left = ''
	right = ''
	
	string.chars{|c|
		if (pivot == c) then
			return false
		elsif (pivot > c)
			left += c
		else
			right += c
		end
	}
	return fact_rec(left) && fact_rec(right) 
end


str = gets.chomp
puts fact_sort(str) 

