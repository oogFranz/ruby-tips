#一桁の数字ごとのビット数をあらかじめグローバル変数として持つ
$one_bit = Array[0,1,1,2,1,2,2,3,1,2]

#BCDでの'1'がたっているビット数を返す
def BcdBitNum(i)
	i.to_s.split('').inject(0){|ans,n| ans + $one_bit[n.to_i]}
end

#'1'がたっているビット数を返す
def BitNum(i)
	i.to_s(2).count('1')
end

count = 0
(10..100).each{|i|
	if BcdBitNum(i) == BitNum(i) then
		count += 1
		#p i
	end
}

print "count= " + count.to_s