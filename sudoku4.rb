

#########refactored sudoku ###############

    class Game
    def initialize(gamematrix)
      @start=gamematrix.map { |e| e.map { |f| f }  }
      @rows=gamematrix#.map { |e| e.map { |f| f }  }
      @nilspaces=findnils
       @startnils=findnils.map { |e| e.map { |f| f } }
       @startnillength=@startnils.length
        $record=0
        $cloest_solve=gamematrix
    end


#########      main game method     #############
#########      main game method     #############

    def sudku
      counter=0
      while @rows.any? { |e| e.any? { |f| f==nil } }
        #current variable is randomly picked from @nilspaces
          current=@nilspaces.sample
          @nilspaces.delete(current)
          #if current is not empty we run it through our guessNum
          if current!=nil
            guessedN=guessNum(@rows.transpose[current[0]], @rows[current[1]])
          else
            #if its empty we reset
              reset
          end
          #guessdN is either a number or nil, if its a number..
          if guessedN != nil
            if current!=nil
              @rows[current[1]][current[0]]=guessedN
            else
              reset #if current nilsapce is nil
            end
          else
                reset#if guessedN returns nil, we reset
          end
          counter+=1
          progress
          display(@rows)
          p "                     number of attempts #{counter}"
      end
  puts "SUDOKU!!!!!"
    end

private
    #this method finds all the nill coordinates in the current board
    def findnils
    nils=[]
        for g in (0..@rows.length-1)
            for p in (0..@rows.length-1)
              if @rows[g][p] != nil
              else
                  nils<<[p,g]
              end
            end
        end
        return nils
    end

    #this keeps progression of numbers
    def progress
      cur= (@rows.length**2) - (@rows.inject(0) {|sum,e| sum+=e.count(nil)})
      if cur>$record
        $record=cur
        $cloest_solve=@rows
      end
    end

    def reset
                @rows=@start.map { |e| e.map { |f| f } }
                @nilspaces=@startnils.map { |e| e.map { |f| f } }
    end


#guesses a number for a given space based on adjacent rows/cols
    def guessNum(vset, hset)
    (1..@rows.length).to_a.delete_if {|e| (hset.include?(e) || vset.include?(e))}.sample

    nums=(1..@rows.length).to_a
    nums.delete_if {|e| hset.include?(e) }
    nums.delete_if {|e| vset.include?(e) }
    return nums.sample
    end
#displays current board
    def display(array)
              p "-----closest_solve-----#{$record}"
        n=""
        for g in array
          out="        "
          for l in g
            out+= "#{'%03s' % l.to_s}"
          end
          out+=" \n"
          n<<out
        end
        puts n
                  p '------------------------------'

    end

#win conditions
    def win?
    @rows.all? { |e| e.uniq.length==@rows.length } && @rows.transpose.all? { |e| e.uniq.length==@rows.transpose.length } && @rows.all? { |e| e.all? { |f| f!=nil  } }
    end

    end









easygame3x3=[[1,nil,nil],[2,3,nil],[nil,nil,2]]
easygame4x4=[[4,nil,nil,nil],[nil,3,4,nil],[nil,1,2,nil],[nil,nil,nil,1]]
mediumgame6x6=[[nil,nil,nil,1,5,nil],[4,nil,3,nil,nil,nil],[nil,nil,nil,nil,nil,nil],[nil,3,nil,5,nil,2],[nil,nil,nil,nil,2,nil],[nil,nil,nil,nil,1,nil]]
hard5x5game=[[5,nil,nil,nil,nil],[nil,nil,nil,5,nil],[nil,4,nil,nil,nil],[nil,nil,1,nil,nil],[nil,nil,nil,3,nil]]
hardfuckingame9x9=[[nil,nil,2,nil,3,nil,nil,nil,nil],[5,nil,nil,9,nil,nil,nil,2,7],[4,nil,6,nil,nil,2,5,nil,nil],[nil,4,nil,nil,nil,nil,9,nil,nil],[9,nil,nil,4,8,7,nil,nil,3],[nil,nil,5,nil,nil,nil,nil,7,nil],[nil,nil,4,2,nil,nil,3,nil,8],[8,3,nil,nil,nil,4,nil,nil,2],[nil,nil,nil,nil,6,nil,7,nil,nil]]

gameone=Game.new(mediumgame6x6)

gameone.sudku
#gameone.original


#puts sudoku([[1,nil,nil],[2,3,nil],[nil,nil,2]])
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

