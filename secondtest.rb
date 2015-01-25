def game
  puts "what are your lotery numbers?"
  numbers=gets.chomp
  lott=[]
  total=[]
while lott != numbers
  while total.include?lott
    lott=[rand(4),rand(4),rand(4)]
  end
  total<<lott
  puts "[#{lott[0].to_s},#{lott[1].to_s},#{lott[2].to_s}] \r"
end
end


def dragon(arr)
arr.map{|e| e%2==0}
end

#puts dragon([2,3,4,5,6,7])
#puts method_name
#puts game

def say_moo num=1

  puts ("moo "*num).chomp
  puts 'yellow submarine'
  'yellow submarine'

end


#puts (say_moo 9).capitalize

def rpeat phrase='matt'
  puts phrase

end

#rpeat 'lao'

def digit(num)
out=[]
n=0
while n<num.length-5
  out<<num[n..n+5]
  n+=1
end

out.max

(0...num.length-5).map { |e| num[e..e+5].to_i }.max

end
#puts digit('3648768768768768768532')


def autocorrect(text)


  #text.gsub /yo+u{1,}/, 'your sister'

 # text.split.map { |e| e.include?('you') ? e.gsub /yo+u{1,}/, 'your sister' : e.include?('u') ? e.gsub /u{1}/, 'your sister' : e }.join(' ')
  #text.split.map { |e| e.include?('you') ? e.gsub /yo+u{1,}/, 'your sister' : e }.join(' ')
end


#puts autocorrect "I love youuu!  you u ursdf"

require 'set'

def sudoku(input)

  #######  extract initial arrays from input  #######
  rows=input
  cols=(0..2).map { |e| rows.map { |f| f[e] } }
  #######  fill in ds  #######
i=0
    #the ith row and use the arrays in the cols in the test
  while i<input.length
qwe=0
      begin
      qwe+=1
      currentrow=rows[i]
          #first guess a row perm
          puts ""
          #puts "current row:  #{currentrow}"
          r=currentrow.map { |e| e==nil ? rand(1..3) : e }
          puts "row #{i+1} :      #{r[0]} , #{r[1]} , #{r[2]}"
          #update ncols with the row numbers
          #puts " ------------------------------------------------- rows:  #{rows}"
          rrows = rows.map { |e| e }
          #puts "  ----------    rrow:  #{rrows}"
          #puts "  ----------    r:  #{r}"
          #puts " ------------------------------------------------- rows:  #{rows}"
          #puts "  ----------    rrow[i]:  #{rrows[i]}"
          rrows[i] = r
          #puts "  ----------    rrow:  #{rrows}"
          #puts " ------------------------------------------------- rows:  #{rows}"
          ncols = (0..2).map { |e| rrows.map { |f| f[e] } }
          puts " ------------------------------------------------- ncols:  #{ncols}"

         #ncols = cols.map { |e| e[i] }

#end loop conditions:  row numbers uniq
      end until (r.uniq.length == r.length) && (ncols.all?{|d| d.reject{|u| u==nil}.length == d.reject{|g| g==nil}.uniq.length})
      #when we find a suitable matches update the ith row and all columns
      puts "row #{i+1} found to be #{r}"
      rows[i]=r
      cols=(0..2).map { |e| rows.map { |f| f[e] } }
      i+=1
  end
####### now we output the rows #######
  " #{rows[0]} \n #{rows[1]} \n #{rows[2]}"
end

##############
def sudtest(input)
rows=input

  #fill in ds
i=0
    #the ith row and use the arrays in the cols in the test
    #while i<input.length
    cols=(0..2).map { |e| rows.map { |f| f[e] } }

    ncols=cols

puts "rows"
puts "#{rows[0]} \n#{rows[1]} \n#{rows[2]}"
puts "columns"
puts "#{cols[0]} \n#{cols[1]} \n#{cols[2]}"
puts "new columns"
#puts "#{ncols[0]} \n#{ncols[1]} \n#{ncols[2]}"

puts ncols.any? { |e| e.reject{|r| r==nil}.length ==1 }
end


puts sudoku([[1,nil,nil],[2,3,nil],[nil,nil,2]])
#puts sudtest([[1,nil,nil],[2,3,nil],[nil,nil,2]])
