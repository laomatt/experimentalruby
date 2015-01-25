# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# I worked on this challenge [by myself, with: ].

# 0. Pseudocode

# What is the input? an array of integers 0-100
# What is the output? (i.e. What should the code return?)a single letter string
# What are the steps needed to solve the problem? parse through the input array, sum up the numbers, then divide the number by the length of the array, then convert that array to a letter grade


# 1. Initial Solution
def get_grade(input)
  #calc total
  total=input.inject(0) {|sum, e| sum+=e}
  #calc avg from total
  avg=total/input.length
  #get grade from average
  if (90...100).include?avg
    return 'A'
  elsif (80...89).include?avg
    return 'B'
  elsif (70...79).include?avg
    return 'C'
  elsif (60...69).include?avg
    return 'D'
  else
    return 'F'
  end
end



# 3. Refactored Solution
def get_grade(input)
   (90...100).include?(input.inject(0) {|sum, e| sum+=e}/input.length) ? 'A' :(80...89).include?(input.inject(0) {|sum, e| sum+=e}/input.length) ? 'B' : (70...79).include?(input.inject(0) {|sum, e| sum+=e}/input.length) ? 'C' : (60...69).include?(input.inject(0) {|sum, e| sum+=e}/input.length) ? 'D' : 'F'
end

# 4. Reflection
#again I do the solutin the long way first,  then refactor it all into one line.


# U2.W4: Calculate the Median!

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# I worked on this challenge [by myself, with: ].

# 0. Pseudocode

# What is the input?  an array of untegers
# What is the output? (i.e. What should the code return?) a single number
# What are the steps needed to solve the problem?  take the length of the array, bi-sect that stuff, and get the index in that of the sorted input array.


# 1. Initial Solution
def median(input)
  if input.length.odd?
    idx=input.length/2
    return input.sort[idx]
  else
    idx1=input.length/2-1
    idx=idx1+1
    return (input.sort[idx]+input.sort[idx1]).to_f/2.0
  end
end


# 3. Refactored Solution
def median(input)
   input.length.odd? ? input.sort[input.length/2] : (input.sort[input.length/2]+input.sort[input.length/2-1]).to_f/2.0
end


# 4. Reflection
#this time I got really stuck on some of the test, but I figured out that I had a +1 index error so all I had to do was put a minus one (-1) on idx1 for the else test.