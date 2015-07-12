class Stack
	def initialize()
		@stack = []
		@sp = 0
	end	
	def push(obj)
		@stack[@sp] = obj
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
	def empty?()
		return @sp <= 0
	end
end 

class MyQueue
	def initialize()
		@stack1 = Stack.new
		@stack2 = Stack.new
	end
	
	def queue(obj)
		while(!@stack1.empty?) do
			@stack2.push(@stack1.pop())
		end
		@stack1.push(obj)
		while(!@stack2.empty?) do
			@stack1.push(@stack2.pop())
		end
	end
	
	def dequeue()
		return @stack1.pop()
	end
end


q = MyQueue.new()
q.queue(5)
q.queue(4)
puts q.dequeue()
q.queue(3)
puts q.dequeue()
puts q.dequeue()

