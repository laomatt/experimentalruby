def detect_int(*lam)
i=1
while lam.map { |e| e[i]==true }.all? == false
  i+=1
end
i
end

lam1 = lambda { |x| x > 9 }
#lam2 = lambda { |x| x.odd?}
lam2 = lambda { |x| x**0.5 % 1 == 0 }

#puts detect_int(lam1, lam2)

#puts detect_int
  # => 1
#puts detect_int lam1
  # => 10
#puts detect_int lam2
  # => 1
#puts detect_int lam1, lam2


class Array

def even
  self.find_all {|e| e.to_i.even? && e.class == Fixnum}
end

def odd
  self.find_all {|e| e.to_i.odd? && e.class == Fixnum}
end

def under(num)
  self.find_all {|t| t.to_i<num}
end

def over(num)
  self.find_all {|t| t.to_i>num}
end

def in_range(range)
  self.find_all {|e| range.include?e.to_i}
end
end

puts [1,2,3,4,5].even == [2,4]
puts [1,2,3,4,5].even == [2,4]
puts [1,2,3,4,5].odd == [1,3,5]
puts [1,2,3,4,5].under(4) == [1,2,3]
puts [1,2,3,4,5].over(4) == [5]
puts [1,2,3,4,5].in_range(1..3) == [1,2,3]
puts (1..100).to_a.even.in_range(18..30) == [18, 20, 22, 24, 26, 28, 30]
puts ["a", 1, "b", 300, "x", "q", 63, 122, 181, "z", 0.83, 0.11].even == [300, 122]