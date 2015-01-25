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
puts "-------------#{a}--------------"
puts "#{bits[0]} - #{bitA[0]} \n#{bits[1]} - #{bitA[1]} \n#{bits[2]} - #{bitA[2]} \n#{bits[3]} - #{bitA[3]} \n#{bits[4]} - #{bitA[4]} \n#{bits[5]} - #{bitA[5]} \n#{bits[6]} - #{bitA[6]} \n#{bits[7]} - #{bitA[7]} \n"
puts "sum: #{bitA.inject(0) {|su, e| su+=e}}"
puts "-------------#{b}--------------"
puts "#{bits[0]} - #{bitB[0]} \n#{bits[1]} - #{bitB[1]} \n#{bits[2]} - #{bitB[2]} \n#{bits[3]} - #{bitB[3]} \n#{bits[4]} - #{bitB[4]} \n#{bits[5]} - #{bitB[5]} \n#{bits[6]} - #{bitB[6]} \n#{bits[7]} - #{bitB[7]} \n"
puts "sum: #{bitB.inject(0) {|su, e| su+=e}}"
puts "Diff: #{(bitA.inject(0) {|su, e| su+=e} - bitB.inject(0) {|su, e| su+=e}).abs}"
puts ""
end


def convertBits2(a,b)
 puts "#{a} : #{a.to_s(2)}"
 puts "#{b} : #{b.to_s(2)}"

 puts "Diff: #{(a.to_s(2).chars.map { |e|e.to_i }.inject(0) {|sum, e| sum+=e} -  b.to_s(2).chars.map { |e|e.to_i }.inject(0) {|sum, e| sum+=e}).abs}"


end


puts "test method"
convertBits(19,256)
puts "control method"
convertBits2(19,256)



#convertBits(47,256)