def method_name(input)

(0..9).to_a.map { |e| input.sample }

end

text="If you specify a block, then for each element in enum the block is passed an accumulator value (memo) and the element. If you specify a symbol instead, then each element in the collection will be passed to the named method of memo. In either case, the result becomes the new value for memo. At the end of the iteration, the final value of memo is the return value for the method.".split

number=[1,2,45,3,2,8,4,5,6,7,8,45,8564,34,2,0,8,4,5,67,23765]

puts method_name(text)