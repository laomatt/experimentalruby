def method_name(a,b)
 a+b
end

def convertBits(a)
  #setup my bits array
bits=[128,64,32,16,8,4,2,1]
bits.map { |e| e<=sumA ?  (sumA-=e; 1) : 0 }.reverse

end

#hoa nguyens  solution
def convertBits(a)
  bits = []
  7.downto(0){|i| a-(2**i) < 0 ? (bits.unshift(0)) : (bits.unshift(1) ; a = a-(2**i))}
  return bits
end

def convertBits(a)
[128,64,32,16,8,4,2,1].map { |e| e<=a ?  (a-=e; 1) : 0 }.reverse
end

########################
def pad(array, min_size, value = nil) #non-destructive
  min_size != 0 ? (0..min_size-1).map { |e| array[e] == nil ? value : array[e] } : array.map { |e| e  }
end

def convertBits2(a)
 pad(a.to_s(2).chars.map { |e|  e.to_i }.reverse,8,0)
end
########################


