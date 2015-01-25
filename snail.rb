
def snail(matrix)
array=matrix
output=[]
while !array.empty?
  output += array[0]
  array.delete_at(0)
  array=array.transpose.reverse
end

output

end


array = [[1,2,3],[4,5,6],[7,8,9]]

puts snail(array) == [1,2,3,6,9,8,7,4,5]

array2 = [[1,2,3],
         [8,9,4],
         [7,6,5]]
snail(array2) == [1,2,3,4,5,6,7,8,9]



def snail(array)
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end