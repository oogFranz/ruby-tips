class MinStack
	attr_reader :sp
	def initialize()
		@stack = []
		@min = []
		@sp = 0
	end	
	def push(obj)
		@stack[@sp] = obj
		@min[@sp] = (@sp != 0) && (@stack[@sp-1] < obj) ? @stack[@sp-1] : obj   
		@sp += 1
		return obj
	end
	def pop()
		if (@sp <= 0) then
			return nil
		end
		@sp -= 1
		return @stack[@sp]
	end
	
	def min()
		return (@sp != 0) ? @min[@sp-1] : nil 
	end
end 


s = MinStack.new()
puts "push " + s.push(3).to_s()
puts "push " + s.push(5).to_s()
puts "min = " + s.min().to_s()
puts "push " + s.push(1).to_s()
puts "min = " + s.min().to_s()
puts "pop " + s.pop().to_s()
puts "min = " + s.min().to_s()
puts "pop " + s.pop().to_s()
 