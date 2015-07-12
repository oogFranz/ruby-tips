n = gets.to_i #段数
pascal = gets.split.map(&:to_i)	#間違ったパスカルの三角形の一行を配列で読む

c = 1	#正しいパスカルの三角形の値を格納

left = 0
right = 0

n.times{|i|
	if ((left == 0) and (pascal[i] != c)) then		#間違っている箇所の左端を探す
			left = i+1
	end
	if left != 0 and pascal[i] == c then		#間違っている箇所の右端を探す
			right = i
			break
	end
	
	c *= n - 1 - i		#正しいパスカルの三角形の次の値を求める
	c /= i + 1			#求めるべき値は n段k個めの時　(n-1)Ck　であることを利用
}

print (n-right+left).to_s() +" "+ left.to_s()
