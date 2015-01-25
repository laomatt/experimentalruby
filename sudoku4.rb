

#########refactored sudoku ###############

  class Game
    def initialize(gamematrix)
      @rows=gamematrix.clone
      @start=gamematrix
      @cols=@rows.transpose
    end

    def findnils
    #puts "finding the nils"
    sleep 0.1
    nilspaces=[]
        for g in (0..@cols.length-1)
            for p in (0..@rows.length-1)
              if @rows[p][g] != nil
              else
                  nilspaces<<[g,p]
              end
            end
        end
        return nilspaces
    end

#########      main game method     #############
#########      main game method     #############

    def sudku
    puts  "we\'re in the sudku method our start matrix is #{@start}"
    sleep 0.8
      while !win?
        xy=findnils.sample
        puts "#{xy}"
          x=xy.first
          y=xy.last
          puts ""
          puts "#{@cols[x]}"
          puts "#{@rows[y]}"
          puts ""
          puts "#{@start}"
          #@rows.map! { |e| e.map { |f| nil } }
          @rows[x][y]=guessNum(@cols[x],@rows[y])
          puts "#{@start==@rows}"
          puts "#{@start}"
          puts "#{@rows}"
      end
    end

     def guessNum(vset, hset)
                              #create an array of numbers to choose from
                              #subtract everything in the choice array thats in the hset and vset
                              #then return a sampled number from it
    (1..@rows.length).to_a.delete_if {|e| (hset.include?(e) || vset.include?(e))}.sample


    end

    def win?
      false
    end

  end


easygame3x3=[[1,nil,nil],[2,3,nil],[nil,nil,2]]
easygame4x4=[[4,nil,nil,nil],[nil,3,4,nil],[nil,1,2,nil],[nil,nil,nil,1]]
mediumgame6x6=[[nil,nil,nil,1,5,nil],[4,nil,3,nil,nil,nil],[nil,nil,nil,nil,nil,nil],[nil,3,nil,5,nil,2],[nil,nil,nil,nil,2,nil],[nil,nil,nil,nil,1,nil]]
hardfuckingame9x9=[[nil,nil,2,nil,3,nil,nil,nil,nil],[5,nil,nil,9,nil,nil,nil,2,7],[4,nil,6,nil,nil,2,5,nil,nil],[nil,4,nil,nil,nil,nil,9,nil,nil],[9,nil,nil,4,8,7,nil,nil,3],[nil,nil,5,nil,nil,nil,nil,7,nil],[nil,nil,4,2,nil,nil,3,nil,8],[8,3,nil,nil,nil,4,nil,nil,2],[nil,nil,nil,nil,6,nil,7,nil,nil]]

gameone=Game.new(easygame4x4)

gameone.sudku
#gameone.original


#puts sudoku([[1,nil,nil],[2,3,nil],[nil,nil,2]])
#puts sudoku([[4,nil,nil,nil],[nil,3,4,nil],[nil,1,2,nil],[nil,nil,nil,1]])

#puts sudoku([[nil,nil,nil,nil,3],[nil,2,nil,nil,nil],[nil,nil,nil,nil,5],[nil,nil,2,1,nil],[1,nil,nil,nil,nil]])
