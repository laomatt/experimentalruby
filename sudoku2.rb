def sudoku(input)
  #extract initial arrays from input rows=input
  rows=input
  cols=(0..input.length-1).map { |e| rows.map { |f| f[e] } }
  #fill in ds
i=0
    #the ith row and use the arrays in the cols in the test
  while i<input.length
    qwe=0
    already=[]
      begin
        qwe+=1

        ##this code finds row by row
          currentrow=rows[i]

          #first guess a unique row perm
          begin
            r=currentrow.map { |e| e==nil ? rand(1..input.length) : e }
            puts "row (guess) #{i+1} : #{r}\n#{(0..input.length-1).map { |e| rows[e].map { |w| w==nil ? " ": w }.join ("  ")}.join("\n")}  (#{qwe}/#{input.length**currentrow.count(nil)})  rows already collected: #{already.uniq.length}  frequency of numbers: #{already.map { |e| already.count(e) }.max}"
          end while(already.include?(r)) && !(qwe >= input.length**currentrow.count(nil))

          already<<r
          puts "row         #{i+1} : #{r}\n#{(0..input.length-1).map { |e| rows[e].map { |w| w==nil ? " ": w }.join ("  ")}.join("\n")}  (#{qwe}/#{input.length**currentrow.count(nil)})  rows already collected: #{already.uniq.length}  frequency of numbers: #{already.map { |e| already.count(e) }.max}"
          #update ncols with the row numbers
          rrows = rows.map { |e| e }
          rrows[i] = r
          ncols = (0..input.length-1).map { |e| rrows.map { |f| f[e] } }



        #end loop conditions:  row numbers uniq
        #puts "-----(#{qwe}/#{input.length**currentrow.count(nil)})-----"
      end until ((r.uniq.length == r.length) && (ncols.all?{|d| d.reject{|u| u==nil}.length == d.reject{|g| g==nil}.uniq.length})) || (qwe >= input.length**currentrow.count(nil))


      #when we find a suitable matches update the ith row and all columns
      #puts "row #{i+1} found to be #{r}"
      rows[i]=r
      cols=(0..input.length-1).map { |e| rows.map { |f| f[e] } }


       ##this code finds column by column
       cwe=0
       alreadycol=[]
       currentcol=cols[i]

       begin
        cwe+=1
          currentcol=cols[i]
          #first guess a unique col perm

          begin
            r=currentcol.map { |e| e==nil ? rand(1..input.length) : e }
            puts "column (guess) #{i+1} : #{r}\n#{(0..input.length-1).map { |e| rows[e].map { |w| w==nil ? " ": w }.join ("  ")}.join("\n")}  (#{cwe}/#{input.length**currentcol.count(nil)})  cols already collected: #{alreadycol.uniq.length}  frequency of numbers: #{alreadycol.map { |e| alreadycol.count(e) }.max}"
          end while(alreadycol.include?(r)) && !(cwe > input.length**currentcol.count(nil))

          alreadycol<<r
          puts "column         #{i+1} : #{r}\n#{(0..input.length-1).map { |e| rows[e].map { |w| w==nil ? " ": w }.join ("  ")}.join("\n")}  (#{cwe}/#{input.length**currentcol.count(nil)})  cols already collected: #{alreadycol.uniq.length}  frequency of numbers: #{alreadycol.map { |e| alreadycol.count(e) }.max}"
          #update
          rcols = cols.map { |e| e }
          rcols[i] = r
          nrows = (0..input.length-1).map { |e| rcols.map { |f| f[e] } }

        #end loop conditions:  col numbers uniq
        #puts "-----(#{cwe}/#{input.length**currentcol.count(nil)})-----"
      end until ((r.uniq.length == r.length) && (nrows.all?{|d| d.reject{|u| u==nil}.length == d.reject{|g| g==nil}.uniq.length})) || (cwe > input.length**currentcol.count(nil))


      #when we find a suitable matches update the ith row and all columns
     # puts "column #{i+1} found to be #{r}"
      cols[i]=r
      rows=(0..input.length-1).map { |e| cols.map { |f| f[e] } }


      i+=1
###this condition is for if we come across a dead end, we reset the process and start over
          if (cwe > input.length**currentcol.count(nil)) || (qwe > input.length**currentrow.count(nil))
                i=0
                rows=input
                cols=(0..input.length-1).map { |e| rows.map { |f| f[e] } }
          end
  end
puts "------------------------------------------------------------------------"
  "#{(0..input.length-1).map { |e| rows[e].join ("  ")}.join("\n")}   SUDOKU!!!!"
end




#########refactored sudoku ###############








easygame3x3=[[1,nil,nil],[2,3,nil],[nil,nil,2]]
easygame4x4=[[4,nil,nil,nil],[nil,3,4,nil],[nil,1,2,nil],[nil,nil,nil,1]]
mediumgame6x6=[[nil,nil,nil,1,5,nil],[4,nil,3,nil,nil,nil],[nil,nil,nil,nil,nil,nil],[nil,3,nil,5,nil,2],[nil,nil,nil,nil,2,nil],[nil,nil,nil,nil,1,nil]]
hardfuckingame9x9=[[nil,nil,2,nil,3,nil,nil,nil,nil],[5,nil,nil,9,nil,nil,nil,2,7],[4,nil,6,nil,nil,2,5,nil,nil],[nil,4,nil,nil,nil,nil,9,nil,nil],[9,nil,nil,4,8,7,nil,nil,3],[nil,nil,5,nil,nil,nil,nil,7,nil],[nil,nil,4,2,nil,nil,3,nil,8],[8,3,nil,nil,nil,4,nil,nil,2],[nil,nil,nil,nil,6,nil,7,nil,nil]]

#gameone=Game.new(easygame4x4)

#gameone.sudku


puts sudoku(mediumgame6x6)
#puts sudoku([[4,nil,nil,nil],[nil,3,4,nil],[nil,1,2,nil],[nil,nil,nil,1]])

#puts sudoku([[nil,nil,nil,nil,3],[nil,2,nil,nil,nil],[nil,nil,nil,nil,5],[nil,nil,2,1,nil],[1,nil,nil,nil,nil]])



#########    hard problems   ############
#puts sudoku([[nil,nil,nil,1,5,nil],[4,nil,3,nil,nil,nil],[nil,nil,nil,nil,nil],[nil,3,nil,5,nil,2],[nil,nil,nil,nil,2,nil],[nil,nil,nil,nil,1,nil]])
#puts sudoku([[nil,nil,3,nil,5,nil,8,nil,nil],[nil,8,nil,nil,nil,nil,nil,2,nil],[5,nil,nil,nil,nil,1,nil,nil,6],[nil,nil,1,9,nil,4,nil,nil,nil],[7,nil,nil,nil,nil,nil,nil,nil,1],[nil,nil,nil,6,nil,8,9,nil,nil],[6,nil,nil,2,nil,nil,nil,nil,9],[nil,2,nil,nil,nil,nil,nil,7,nil],[nil,nil,9,nil,6,nil,3,nil,nil]])
#puts sudoku([[nil,nil,nil,nil,nil],[nil,4,nil,nil,nil],[nil,nil,nil,5,nil],[1,nil,nil,nil,nil],[nil,nil,5,nil,2]])
#puts sudoku([[nil,2,nil,4,nil],[nil,nil,3,nil,nil],[nil,1,nil,2,nil],[nil,4,nil,nil,nil],[nil,nil,nil,nil,4]])
#puts sudoku([[5,nil,nil,nil,nil],[nil,nil,nil,5,nil],[nil,4,nil,nil,nil],[nil,nil,1,nil,nil],[nil,nil,nil,3,nil]])
#puts sudoku([[nil,nil,4,6,nil,nil],[nil,3,nil,nil,nil,nil],[3,4,nil,2,nil,nil],[5,nil,2,nil,6,nil],[2,5,nil,nil,3,nil],[nil,nil,nil,nil,nil,1]])
##puts sudoku([[nil,5,nil,nil,nil,2],[nil,nil,nil,nil,nil,4],[nil,nil,4,1,nil,nil],[1,nil,3,2,nil,nil],[2,nil,nil,nil,6,nil],[nil,4,1,5,2,nil]])
#puts sudoku([[nil,nil,2,nil,3,nil,nil,nil,nil],[5,nil,nil,9,nil,nil,nil,2,7],[4,nil,6,nil,nil,2,5,nil,nil],[nil,4,nil,nil,nil,nil,9,nil,nil],[9,nil,nil,4,8,7,nil,nil,3],[nil,nil,5,nil,nil,nil,nil,7,nil],[nil,nil,4,2,nil,nil,3,nil,8],[8,3,nil,nil,nil,4,nil,nil,2],[nil,nil,nil,nil,6,nil,7,nil,nil]])

