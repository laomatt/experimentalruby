def fivedigitnumber
gen=(0..9).to_a

p=0
while p==0
number="#{gen.sample}#{gen.sample}#{gen.sample}#{gen.sample}#{gen.sample}"
numbertwo=('1'+number).to_i
numberthree=(number+'1').to_i

  if numbertwo==(numberthree/3)

    puts number
  end
end

end


fivedigitnumber