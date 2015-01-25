def capwords(str)

str.split.reject {|e| e.length!=4}.join(" - ")

end
##puts capwords("Matt lao is a boss")

##puts [1,2,3,4].map {|e| e**2}
########################################################################
def house_of_cards(floors)
  #good luck!
  if floors==0
      raise "error, floors can't be 0"
  else
    7+(2..floors).map{|e| 3*e+2}.inject(0){|sum, d| sum+=d}
  end
end
################################################
def group_and_count(input)
  ##modified if-else statement
  return nil if input.nil? || input.empty?
  input.each_with_object(Hash.new(0)){ |k, h| h[k] += 1 }
end

################################################
def sort_string(str, ordering)
Hash[Hash[str.chars.zip(str.chars.map { |e| (ordering.include?(e)) ? Hash[ordering.chars.zip((0...ordering.length))][e] : ordering.length+1 })].sort_by{|k,v| v}].keys.join
#better solution would be:
str.chars.sort_by { |c| ordering.index(c) || ordering.size }.join
end

######################## DragonCurve  ########################
def Dragon(n)
  out="Fa"
  return '' if n.is_a? String || n < 0
(0..0).cycle(n) {out=out.chars.map { |e| e=='a' ? 'aRbFR': e=='b' ? 'LFaLb' : e }.join}
out.chars.reject {|r| (r=='a') || (r=='b')}.join
end

##another sol
def Dragon n
  return '' unless n.is_a?(Integer)&&n>=0
  str='Fa'
  n.times{
    str.gsub!(/[ab]/){|match|match=='a' ? 'aRbFR' : 'LFaLb'}
  }
  str.gsub(/[ab]/,'')
end

def Dragon n
  return '' unless n.is_a?(Integer)&&n>=0
  str='Fa'
  n.times{
    str.gsub!('a','1').gsub!('b','LFaLb')
    str.gsub!('1','aRbFR')
  }
  str.gsub(/[ab]/,'')
end

def Dragon n
  return '' unless n.is_a?(Integer) && n >= 0
  str = 'Fa'
  n.times do
    str.gsub!('a', 'aRbFR').gsub!('b', 'LFaLb')
  end
  str.delete('ab')
end


def validation string

 ((string.chars.first==" " && string.chars.last==" " && string.chars.all?{|t| !("[:alpha:]".include?(t.downcase))} && string.chars.map { |e| e==" "? "g" : "w"  }.join.scan(/w*/).partition {|e| e.include?('w')}[0].length==1) || string=='' || string==' ' )? string.to_i+1 : "invalid"

end


def flesch_kincaid text
  #average number of words per sentence
  avwr=text.split(".").inject(0) { |sum, e| sum+=e.split.length }.to_f/text.split(".").length

  #average syllables per word
  syll=text.split.inject(0) {|sum, e| sum+=e.scan(/[aeiou][[:alpha:]]{,1}/).length}.to_f/text.split.length
#solution line
("%.2f" % ((0.39 * avwr) + (11.8 * syll) - 15.59)).to_f

#single line solution
("%.2f" % ((0.39 * (text.split(".").inject(0) { |sum, e| sum+=e.split.length }.to_f/text.split(".").length)) + (11.8 * (text.split.inject(0) {|sum, e| sum+=e.scan(/[aeiou][[:alpha:]]{,1}/).length}.to_f/text.split.length)) - 15.59)).to_f

end


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

#two line solution

f4=Hash[Hash[Hash[Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].to_a.zip(Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].values.map { |e| Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].values.find_all {|f| f==e}.length })].find_all{|k,v| v==1}].keys].min_by {|k,v| v}.to_a.first
(f4 != Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].min_by {|k,v| v}.to_a.first)? nil : f4

#single line solution
((Hash[Hash[Hash[Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].to_a.zip(Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].values.map { |e| Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].values.find_all {|f| f==e}.length })].find_all{|k,v| v==1}].keys].min_by {|k,v| v}.to_a.first) != Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].min_by {|k,v| v}.to_a.first)? nil : f4
  end



########################################################################
########################################################################
def testmethod text

#input.gsub('him','her').gsub('Him','Her').gsub('his', 'her').gsub('His','Her').gsub('He','She')

#.gsub(' he ',' she ').gsub(' Him ',' Her ').gsub(' His ', ' Her ').gsub(' He',' She ')
f=['.', '!', '?', ',']
text.split.map { |e| e.chars.reject{|c| f.include?(c)}.join=='His' ? e.gsub('His','Her'): e }.map { |e| e.chars.reject{|c| f.include?(c)}.join=='Him' ? e.gsub('Him','Her'): e }.map { |e| e.chars.reject{|c| f.include?(c)}.join=='He' ? e.gsub('He','She'): e }.map { |e| e.chars.reject{|c| f.include?(c)}.join=='his' ? e.gsub('his','her'): e }.map { |e| e.chars.reject{|c| f.include?(c)}.join=='him' ? e.gsub('him','her'): e }.map { |e| e.chars.reject{|c| f.include?(c)}.join=='he' ? e.gsub('he','she'): e }.join(" ")


#male=>>female
text.split.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='His' ? e.gsub('His','Her'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='Him' ? e.gsub('Him','Her'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='He' ? e.gsub('He','She'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='his' ? e.gsub('his','her'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='him' ? e.gsub('him','her'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='he' ? e.gsub('he','she'): e }.join(" ")

#female=>male
text.split.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='Hers' ? e.gsub('Hers','His'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='Her' ? e.gsub('Her','Him'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='She' ? e.gsub('She','He'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='hers' ? e.gsub('hers','his'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='her' ? e.gsub('her','him'): e }.map { |e| e.chars.reject{|c| ['.', '!', '?', ','].include?(c)}.join=='she' ? e.gsub('she','he'): e }.join(" ")


#{ |e| e=='He'? e.gsub('He','She'): e }.map { |e| e=='Him'? e.gsub('Him','Her'): e }.join(" ")

end


def evalidate(email)
(email.split("@").reject {|e| e==""}.length==2) && (email.split("@")[1].split('.').reject {|e| e==""}.length==2)
end


########################################################################

digits = Enumerator.new do |y|
  i = 0
  loop do
    y.yield i
    i += 1
  end
end

#puts digits.next
#puts digits.next
#puts digits.next
#puts digits.next

#puts digits.take_while {|n| n<13}


fib = Enumerator.new do |y|
  i=1
  j=0
  m=0
  loop do
    j=i
    i=m
    m=i+j
    y.yield j
    i+=1
  end
end
###################################################
##a better solution
fib = Enumerator.new do |yielder|
  a, b = 1,1

  loop do
    yielder.yield a
    a, b = b, a + b
  end
end



def userinput
  puts "enter something"
  variable=gets.chomp

  "this dude #{variable} is a fucking boss!!"
end


###################################################


def angryboss
  puts "What the fuck do you want?"
  demand = gets.chomp
  puts "WHADDAYA MEAN \"#{demand.upcase} \"!??! YOU'RE FIRED!!!! "
end

def toc
  width=100
puts "Table of Contents".center(width)
puts "Chapter 1: Getting Started Chapter 2: Numbers".ljust(width/2) + "page  1".rjust(width/2)
puts "Chapter 3: Letters".ljust(width/2)+"page  9".rjust(width/2)
puts "Higher Math".ljust(width/2)+"page 13".rjust(width/2)
end





def anglebetween(time)
  mins=Hash[[00,15,30,45].zip([00,90,180,270])]
  hours=Hash[[12,3,6,9].zip([00,90,180,270])]
  arr=time.split(":")

  time2=Hash[[0,90,180,270].zip(["0","pi/2","pi","pi/2"])]

 # (hours[arr.first.to_i] - mins[arr.last.to_i]).abs > 180 ? (hours[arr.first.to_i] - mins[arr.last.to_i]).abs - 180 : (hours[arr.first.to_i] - mins[arr.last.to_i]).abs

#consolidated
  #(Hash[[12,3,6,9].zip([00,90,180,270])][time.split(":").first.to_i] - Hash[[00,15,30,45].zip([00,90,180,270])][time.split(":").last.to_i]).abs > 180 ? (Hash[[12,3,6,9].zip([00,90,180,270])][time.split(":").first.to_i] - Hash[[00,15,30,45].zip([00,90,180,270])][time.split(":").last.to_i]).abs - 180 : (Hash[[12,3,6,9].zip([00,90,180,270])][time.split(":").first.to_i] - Hash[[00,15,30,45].zip([00,90,180,270])][time.split(":").last.to_i]).abs

#to radians
  Hash[[0,90,180,270].zip(["0","pi/2","pi","pi/2"])][(Hash[[12,3,6,9].zip([00,90,180,270])][time.split(":").first.to_i] - Hash[[00,15,30,45].zip([00,90,180,270])][time.split(":").last.to_i]).abs > 180 ? (Hash[[12,3,6,9].zip([00,90,180,270])][time.split(":").first.to_i] - Hash[[00,15,30,45].zip([00,90,180,270])][time.split(":").last.to_i]).abs - 180 : (Hash[[12,3,6,9].zip([00,90,180,270])][time.split(":").first.to_i] - Hash[[00,15,30,45].zip([00,90,180,270])][time.split(":").last.to_i]).abs]

end


puts anglebetween("3:00")# == 90
puts anglebetween("3:30")# == 90
puts anglebetween("6:30")# == 0
puts anglebetween("9:00")# == 90
puts anglebetween("3:45")# == 180
puts anglebetween("6:00")# == 180
puts anglebetween("9:45")# == 0


#puts toc

#puts angryboss
#puts fib.next
#puts fib.next
#puts fib.next
#puts fib.next
#puts fib.next
#puts fib.next
#puts fib.next
#puts fib.next
#puts fib.next
#puts fib.next
#puts fib.take_while {|n| n<113}





########################################################################
#puts '---------------matt@mattlao.com------------------'
#puts evalidate("matt@mattlao.com") == true
#puts '----------------matt@mattlao.org-----------------'
#puts evalidate("matt@mattlao.org") == true
#puts '----------------matt@mattlaoorg.-----------------'
#puts evalidate("matt@mattlaoorg.") == false
#puts '----------------matt@.mattlaoorg-----------------'
#puts evalidate("matt@.mattlaoorg") == false
#puts '----------------lkj@-----------------'
#puts evalidate("lkj@") == false
#puts '-------------------matt@mattlao--------------'
#puts evalidate("matt@mattlao") == false
#puts '------------------@mattlao.com---------------'
#puts evalidate("@mattlao.com") == false
#puts '---------------joe------------------'
#puts evalidate("joe") == false

#puts "testmethod tests"

#puts testmethod "His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years."

#puts testmethod "His. His! His"
#puts testmethod "Her. Her! Her"

#result must not occur the same amount of time that any other does
#of these results select the number that occurs the LEAST amount of times

#puts "tests find_suspect method"
#puts find_suspect(1, 2, 3, 4, 2, 2, 1, 4, 4) == 3
#puts find_suspect(1, 1, 2, 2) == nil
#puts find_suspect(1, 1, 2, 2, 2) == 1
#puts find_suspect(1, 2, 3, 4, 4, 3) == nil


#puts "tests for flesch_kincaid method"
text="a good book is hard to find."
#puts flesch_kincaid text
#puts flesch_kincaid "turtle"
#puts text.split(".").inject(0) { |sum, e| sum+=e.split.length }.to_f

#puts "Tests for validation"
#puts validation (" matt  ")
#puts validation (" 3 ")
#puts validation (" 3 4 ")
#puts validation ("34 ")
#puts validation('')
#puts validation(' 123 ') == 124
#puts validation('a') == 'invalid'
#puts validation(' 2 8 ') == 'invalid'
#puts validation(' a 8') == 'invalid'
#puts validation('abc1') == 'invalid'
#puts validation('  8392    ')

#puts "DragonCurve method tests"
#puts Dragon('n') == nil
#puts Dragon(-1) == nil
#puts Dragon(0) == 'F'
#puts Dragon(1) == 'FRFR'
#puts Dragon(2) == 'FRFRRLFLFR'
#FRFRRLFLFRRLFRFRLLFLFRRLFRFRRLFLFRLLFRFRLLFLFR

#puts "tests for house_of_cards method"
#puts house_of_cards(1) == 7
#puts house_of_cards(2) == 7+8
#puts house_of_cards(3) == 7+8+11
#puts house_of_cards(4) == 7+8+11+14
#puts house_of_cards(5) == 7+8+11+14+17
#puts house_of_cards(6) == 7+8+11+14+17+20

#puts house_of_cards(3)
