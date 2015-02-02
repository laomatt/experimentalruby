

text="
//put your code inside of here
"

array=text.split("\n")

puts '<PRE>'
array.each_with_index {|e, i| puts "#{i}: #{e}"}
puts '</PRE>'