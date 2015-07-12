facade = [1,14,14,4,11,7,6,9,8,10,10,5,13,2,3,15]	#魔方陣に表れる数字
SIZE = 66
memo = Array.new(SIZE+1, 0)	#大きさ67の配列を初期化
memo[0] = 1	#0のみ1で初期化

facade.each{|n|
	(SIZE-n).downto(0){|i|
		if memo[i] != 0 then
			memo[i+n] += memo[i]	#i+nになるパターン数にiのパターン数だけ足す。
		end
	}
}
p memo.index(memo.max)	#最大値を持つ要素番号=答えを出力
