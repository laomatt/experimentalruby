def capwords(str)

str.split.reject {|e| e.length!=4}.join(" - ")

end
#puts capwords("Matt lao is a boss")

#puts [1,2,3,4].map {|e| e**2}
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

("%.2f" % ((0.39 * avwr) + (11.8 * syll) - 15.59)).to_f

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



f4=Hash[Hash[Hash[Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].to_a.zip(Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].values.map { |e| Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].values.find_all {|f| f==e}.length })].find_all{|k,v| v==1}].keys].min_by {|k,v| v}.to_a.first
(f4 != Hash[numbers.zip(numbers.map { |e| numbers.find_all {|f| f==e}.length  })].min_by {|k,v| v}.to_a.first)? nil : f4
  end



########################################################################





#result must not occur the same amount of time that any other does
#of these results select the number that occurs the LEAST amount of times
#puts find_suspect(1, 2, 3, 4, 2, 2, 1, 4, 4) == 3
#puts find_suspect(1, 1, 2, 2) == nil
#puts find_suspect(1, 1, 2, 2, 2) == 1
#puts find_suspect(1, 2, 3, 4, 4, 3) == nil


#text="a good book is hard to find."
#puts flesch_kincaid text
#puts flesch_kincaid "turtle"
#puts text.split(".").inject(0) { |sum, e| sum+=e.split.length }.to_f
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

#puts Dragon('n')
#puts Dragon(-1)
#puts Dragon(0) == 'F'
#puts Dragon(1) == 'FRFR'
#puts Dragon(2) == 'FRFRRLFLFR'
#FRFRRLFLFRRLFRFRLLFLFRRLFRFRRLFLFRLLFRFRLLFLFR
#puts house_of_cards(1) == 7
#puts house_of_cards(2) == 7+8
#puts house_of_cards(3) == 7+8+11
#puts house_of_cards(4) == 7+8+11+14
#puts house_of_cards(5) == 7+8+11+14+17
#puts house_of_cards(6) == 7+8+11+14+17+20

#puts house_of_cards(3)
