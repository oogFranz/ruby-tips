class BinTree
	def initialize()
		@left = nil
		@right = nil
		@value = 0
		@generation = 0
	end
	def initialize(arr,generation)
		@generation = generation
		size = arr.size
		if size == 1 then
			@left = nil
			@right = nil
			@value = arr[0]
		elsif size == 2 then
			@left = BinTree.new(arr[0,1], generation + 1)
			@right = nil
			@value = arr[1]
		else
			mid = size/2
			@left = BinTree.new(arr[0,mid], generation + 1)
			@right = BinTree.new(arr[mid+1,mid], generation + 1)
			@value = arr[mid]
		end
	end
	def search
	def to_s()
		string = " "*(@generation-1) + "-" + @value.to_s + "\n" 
		string += @left != nil ? @left.to_s : "" 
		string += @right != nil ? @right.to_s : "" 
	end
end


tree = BinTree.new([1,2,3,4,5,6],1)
print tree.to_s
