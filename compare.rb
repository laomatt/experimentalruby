def pad(array, min_size, value = nil) #non-destructive
  min_size != 0 ? (0..min_size-1).map { |e| array[e] == nil ? value : array[e] } : array.map { |e| e  }
end

def convertBits2(a)
 pad(a.to_s(2).chars.map { |e|  e.to_i }.reverse,8,0)
end

def convertBits(a)
  bits=[128,64,32,16,8,4,2,1]
  sumA=a
  bits.map { |e| e<=sumA ?  (sumA-=e; 1) : 0 }.reverse
end

def compare
  begin
  a=rand(256)
  puts " #{a} || #{convertBits2(a)} --  #{convertBits(a)}"
  end while convertBits2(a) == convertBits(a)
end

compare