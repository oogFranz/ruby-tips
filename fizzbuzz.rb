#if文を使わない。
#puts (1..100).map{|i| i%3<1?(i%5<1? 'FizzBuzz':'Fizz'):(i%5<1? 'Buzz':i)}
puts (1..100).map{|i| i%3<1&&s='Fizz';i%5<1? s+'Buzz':s||i}
#if文を使わない。少し短く。
#puts (1..100).map{|i|[i,'Fizz','Buzz','FizzBuzz'][i%3==0?1:0+i%5==0?2:0]}
#1.upto(?d){|i|i%3<1&&x=:Fizz;puts i%5<1?"#{x}Buzz":x||i}

#if文を使わない。三項演算子も使わない。
#puts (1..100).map{|i|[i,'Fizz','Buzz','FizzBuzz']['300102100120100'[i%15].to_i]}

#if文を使わない。剰余記号%を使わない。
#puts (1..100).map{|i|[i,'Fizz','Buzz','FizzBuzz']['300102100120100300102'[(i>>4)+(i&15)].to_i]}

