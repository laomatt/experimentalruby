############################################################################################################

##various methods used in hash, and you can use them in order as shown

def list_in_range(hash, range)
  hash
    #select the key k and value v only if the 'range' includes the value v.
    .select { |k, v| range.include?(v) }
    #sort the resulting hash by values
    .sort_by { |k, v| v }
    #map the keys k, and values v to a string array
    .map { |k, v| "#{k} (#{v})" }
    #then join all the strings in that array with a ',' delimeter inbetween elements.
    .join(", ")
end

############################################################################################################

#you can use the excape char #{} to insert ruby code into the braces and have it execute.  in this case the 'cc' is the variable to check, print out which ever one works...
#this particular code uses a .map method, the cc is the variable to be used to do something.

def capital(capitals_hash_array)
  capitals_hash_array.map {|cc| "The capital of #{cc[:state] || cc['state'] || cc[:country] || cc['country']} is #{cc[:capital] || cc['capital']}"}
end


############################################################################################################

variable length arguments in ruby
def function(*args)
#args is passed as an array of arguments.
)


############################################################################################################

##short cut to map from 0 to a max (size)
# [some array].map{|variable| do something with that variable}

#.. - to include the maxsize number
#...- to not include the maz number

# Checkerboard method
def checkerboard(size)
  (0...size).map { |i|
    (0...size).map { |j| "[#{'rb'[(i + j) % 2]}]" }.join('') + "\n"
  }.join ''
end


############################################################################################################

#this lamba takes two variables, sum and c, and iterates it over the coords array.  the inject method applies all elements of the array, starting at the index inside the (), by the given method in the lambda, in this case its sum += c**2
def in_sphere?(coords, radius)
  #this statement result in either true or false, thus no need for return statments or if-else statments, because this will automatically return
  coords.inject(0){|sum, c| sum += c**2 } <= radius**2
end

############################################################################################################

#if its an odd numbered length string, we add a _ to it to make it an even numbered length string
#use .scan to cycle through letters
#.scan scans each letter in the string, every two lets '..'
def solution(str)
  if (str.length % 2) == 1
    str << "_"
  end
  str.scan(/../)
end

other hander methods
size.even?
is_a?

#########################################################################################################

#A Narcissistic Number is a number which is the sum of its own digits, each raised to the power of the number of digits.

For example, take 153 (3 digits):

    1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
and 1634 (4 digits):

    1^4 + 6^4 + 3^4 + 4^4 = 1 + 1296 + 81 + 256 = 1634
The Challenge:

Your code must return true or false depending upon whether the given number is a Narcissistic number.

Error checking for text strings or other invalid inputs is not required, only valid integers will be passed.



#my solution:
value.to_s.chars.map {|e| e.to_i**value.to_s.length}.inject {|sum, i|sum+=i}==value

################################################################################################################################
make a hash
given two arrays, keys and values

Hash[keys.zip(values)]

Hash["a", 100, "b", 200]             #=> {"a"=>100, "b"=>200}
Hash[ [ ["a", 100], ["b", 200] ] ]   #=> {"a"=>100, "b"=>200}
Hash["a" => 100, "b" => 200]         #=> {"a"=>100, "b"=>200}

################################################################################################################################


def group_and_count(input)
  ##modified if-else statement
  return nil if input.nil? || input.empty?
  input.each_with_object(Hash.new(0)){ |k, h| h[k] += 1 }
end

####################################################################################################  SHERLOCK  ############################################################################################################################################################


Sherlock has to find suspect on his latest case. He will use your method, dear Watson. The suspect in this case is a number which is most unique in given set, e.g.:

has least (minimum) occurences in set
and no other number has the same occurences count
Write method which helps Sherlock to find suspect from given set of numbers. If no suspect is found the method should return nil.

find_suspect(1, 2, 3, 4, 2, 2, 1, 4, 4) # => 3
find_suspect(1, 1, 2, 2) # => nil
find_suspect(1, 1, 2, 2, 2) # => 1
find_suspect(1, 2, 3, 4, 4, 3) # => nil

{'x'=>65,'b'=>88,'r'=>9,'t'=>677,'a'=>12,'v'=>85,'c'=>55}
  ## solution ##

  def find_suspect(*numbers)
    #first found an array of frequencies of each entry
freq=numbers.map { |e| numbers.find_all {|f| f==e}.length  }

#then hashed it over to its entries, so I have a hash of entries and freqencies
freq2=Hash[numbers.zip(freq)]
freq2=Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })]

#then I took another derivative, found the frequencies of these freqencies,
freq2.values.map { |e| freq2.values.find_all {|f| f==e}.length }

#and hashed it over to the orig hash
Hash[freq2.to_a.zip(freq2.values.map { |e| freq2.values.find_all {|f| f==e}.length })]

#then I found all the entries in the double hash for which v (the frequency of the frequency equals one)
freq3=Hash[freq2.to_a.zip(freq2.values.map { |e| freq2.values.find_all {|f| f==e}.length })].find_all{|k,v| v==1}

#now i take the values for which the frequency of the frequency is 1 (freq3) and single out the min by keys, and take its firt entry (the key)

f4=Hash[Hash[freq3].keys].min_by {|k,v| v}.to_a.first
#freq2[f4]
#freq2.min_by {|k,v| v}.to_a.first
(f4 != freq2.min_by {|k,v| v}.to_a.first)? nil : f4

  end

###### MY TWO LINE SOLUTION #########
f4=Hash[Hash[Hash[Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].to_a.zip(Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].values.map { |e| Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].values.find_all {|f| f==e}.length })].find_all{|k,v| v==1}].keys].min_by {|k,v| v}.to_a.first
(f4 != Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].min_by {|k,v| v}.to_a.first)? nil : f4

########################  BETTER SOLUTIONS ######################
# return suspect number from given set, return nil if no suspect found
def find_suspect(*numbers)
  hash = numbers.each_with_object(Hash.new 0) { |n, o| o[n] += 1 }
  hash.select! { |k, v| v == hash.values.min }
  hash.size == 1 ? hash.keys.first : nil
end



# return suspect number from given set, return nil if no suspect found
def find_suspect(*numbers)
  min = numbers.min_by{|i| numbers.count i}
  min if min == numbers.reverse.min_by{|i| numbers.count i}
end




# return suspect number from given set, return nil if no suspect found
def find_suspect(*numbers)
  ((x, y), (z, _)) = numbers.group_by(&:to_i).map{|x, y| [y.length, x]}.sort_by{|(x, _)| x}
  x != z ? y : nil
end
################################################################################################################################################################################################################################################################

Email addresses are notoriously difficult to validate.

Create a method that takes an email and returns true if valid, false otherwise.

Tip: It doesn't have to be perfect.

For example:

validate('joe@example.com') => true
validate('joe') => false
Here's tool that may help: http://rubular.com/

I suggest not using some code that you find on the internet. Yes, there are regexes that do email validation. But what is the purpose of copying and pasting?

Also, you do not need to use a regex. There are many ways of solving this.

  #my solution

  #solution using regex
def validate(email)
  /^.+@.+\..+$/ === email
end

def validate(email)
  !!(email =~ /^[\w\.\-]+@[\w\-]+(\.\w+)+$/)
end

def validate(email)
  !!(email =~ /.+@.+\..+/)
end


##################################################
Welcome. In this kata, you are asked to square every digit of a number.

For example, if we run 9119 through the function, 811181 will come out.

Note: The function accepts an integer and returns an integer

############################################################

Your task is to split the chocolate bar of given dimension n x m into small squares. Each square is of size 1x1 and unbreakable. Implement a function that will return minimum number of breaks needed.

For example if you are given a chocolate bar of size 2 x 1 you can split it to single squares in just one break, but for size 3 x 1 you must do two breaks.

If input data is invalid you should return 0 (as in no breaks are needed if we do not have any chocolate to split). Input will always be a non-negative integer.