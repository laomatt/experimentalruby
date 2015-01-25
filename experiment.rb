def convertBits(a,b)
  #setup my bits array
bits=[128,64,32,16,8,4,2,1]
#convert both A and B to their bit array
#bitA=bits.map { |e| e < a ?  1 : 0 }
bitA=[]
bitB=[]
sumA=a
sumB=b
for g in bits
  if g <= sumA
    bitA<<1
    sumA-=g
  else
    bitA<<0
  end
end


for g in bits
  if g <= sumB
    bitB<<1
    sumB-=g
  else
    bitB<<0
  end
end

#add up all the numbers

(bitA.inject(0) {|su, e| su+=e} - bitB.inject(0) {|su, e| su+=e}).abs
end


def convertBits2(a,b)
 (a.to_s(2).chars.map { |e|e.to_i }.inject(0) {|sum, e| sum+=e} -  b.to_s(2).chars.map { |e|e.to_i }.inject(0) {|sum, e| sum+=e}).abs


end


def convertBits2(a)
 a.to_s.chars.map { |e|  e.to_i }
end



def convertBits(a)
  #setup my bits array
bits=[128,64,32,16,8,4,2,1]
sumA=a
bits.map { |e| e<=sumA ?  (sumA-=e; 1) : 0 }.reverse

end




def compare
  begin
  a=rand(257)
  b=rand(257)
  puts "a: #{a} | b: #{b} | #{convertBits2(a,b)} --  #{convertBits(a,b)}"
  end while convertBits2(a,b) == convertBits(a,b)


end

puts compare