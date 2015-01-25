def top_3_words(str)
  alpha='abcdefghijklmnopqrstuvwx\'yz'.chars
  #create an array called par, elements are the  lowercase with only letters in alpha
  par=str.split.map { |e| e.chars.map { |r| alpha.include?(r.downcase) ? r.downcase : '' }.join }
  #now create a fequency arrays for every element in par
  freq=par.map { |e| par.count(e)  }


  #this code is for the number of output elementsi n the out array
  uniqueletts=str.split.uniq.length
  uniqueletts > 3 ? topnum = 3 : uniqueletts > 2 ? topnum = 2 : uniqueletts > 1 ? topnum = 1 : topnum = 0

Hash[Hash[par.zip(freq)].sort_by {|k,v| v}].keys.last(topnum).reverse

end

#def top_3_words(str)
#end

#puts top_3_words("In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.")

describe 'top_3_words for string: ' do
it ' a long paragraph ' do
expect(top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")).to eq(["a", "of", "on"])
end

it ' words that don\'t nessesarily make any sense' do
expect(top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")).to eq(["e", "ddd", "aa"])
end

it ' filters out special characters ' do
expect(top_3_words("  //wont won't won't wont")).to eq(["won't", "wont"])
end
it 'if unique words total less than 3' do
expect(top_3_words(" ass wont wont")).to eq(["wont"])
end

end