

#########refactored sudoku ###############

    class Game
    def initialize(gamematrix)
      @start=gamematrix.map { |e| e.map { |f| f }  }
      @rows=gamematrix#.map { |e| e.map { |f| f }  }
     @nilspaces=findnils
     @startnils=findnils.map { |e| e.map { |f| f } }
     @startnillength=@startnils.length

    end

    def findnils
    #puts "finding the nils"
    #sleep 0.1
    nils=[]
        for g in (0..@rows.length-1)
            for p in (0..@rows.length-1)
              if @rows[g][p] != nil
                #puts "[#{g}][#{p}]"
              else
                #puts "      [#{g}][#{p}] :found a nil!!!"
                  nils<<[p,g]
              end
            end
        end
        return nils
    end


#########      main game method     #############
#########      main game method     #############

    def sudku
    puts  "we\'re in the sudku method our start matrix is #{@start}"
    #sleep 0.8

      #while !win?
      #while !@nilspaces.empty?
      while @rows.any? { |e| e.any? { |f| f==nil } }
      #  begin
              #puts '5 now our @nilspaces array now looks like this: '
              #puts "nils: [#{@nilspaces}]                 length #{@nilspaces.length}"
              #sleep 0.4
          current=@nilspaces.sample     #randomly find an empty nil space, find its coordinates in the matrix
                #puts "out current nilspace coordinate is  [#{current}]"
                #sleep 0.2
          @nilspaces.delete(current)
                #puts "after deleting the picked nilspace: [#{@nilspaces}]                 length #{@nilspaces.length}"
                #sleep 0.2
          #then use the guessNum method to guess based on the coordinates
          if current!=nil
          guessedN=guessNum(@rows.transpose[current[0]], @rows[current[1]])
           else
              reset

          end
                #puts "guessed: #{guessedN}"
                #sleep 0.2
          #assign out guessed number to replace the nil
          if guessedN != nil
            if current!=nil
              @rows[current[1]][current[0]]=guessedN
            else
              reset
            end
            #@start[current[0]][current[1]]=nil
                #sleep 0.1
                #puts "guessed returns a number(#{guessedN}) so @rows is #{@rows[current[0]][current[1]]}"
                #puts ''
                #puts "start matrix - #{@start}"
                #puts "row matrix   - #{@rows}"
                #puts "                                =====> =====> =====>     start matrix: #{@start==@rows}    <===== <===== <====="
                #puts "                                =====> =====> =====>     start nils: #{@startnils}  length #{@startnils.length}  <===== <===== <====="
                #puts ''

          else
                #puts "          ==    returned nil so now we must reset    ==    "
                reset
          end

          display
        #sleep 0.4

      end

puts "SUDOKU!!!!!"
    end

    def reset
                #  puts "=========================="
               # sleep 1.0
                #reset
                #  puts "resets everything"
                    #sleep 0.8
                @rows=@start.map { |e| e.map { |f| f } }
                 # puts "rows reset?: #{@rows==@start} #{@start} "
                @nilspaces=@startnils.map { |e| e.map { |f| f } }
                 # puts "nils reset?: #{@nilspaces==@startnils} #{@startnils}                length #{@nilspaces.length}"
                #puts "=========================="
                #sleep 2.0

    end



    def guessNum(vset, hset)
      #p "selecting numbers for #{vset} and #{hset}"
                              #create an array of numbers to choose from
                              #subtract everything in the choice array thats in the hset and vset
                              #then return a sampled #number from it
    (1..@rows.length).to_a.delete_if {|e| (hset.include?(e) || vset.include?(e))}.sample

    nums=(1..@rows.length).to_a
    #p "our starting pool: #{nums}"
    #sleep 0.5
    #p "subtracts #{hset}"
    #sleep 0.5
    nums.delete_if {|e| hset.include?(e) }
    #sleep 0.5
    #p "our remaining set #{nums}"
    #sleep 0.5
    #p "subtracts #{vset}"
    #sleep 0.5
    nums.delete_if {|e| vset.include?(e) }
    #sleep 0.5
    #p "our remaining set #{nums}"
    #sleep 0.5

    return nums.sample


    end

    def display
     # puts "--------------------"
      for g in @rows
        out="        "
        for l in g
          out+= "#{'%03s' % l.to_s}"
        end
        out+=" \n"
        puts out
      end
     # puts "--------------------"
    end


    def win?
    @rows.all? { |e| e.uniq.length==@rows.length } && @rows.transpose.all? { |e| e.uniq.length==@rows.transpose.length } && @rows.all? { |e| e.all? { |f| f!=nil  } }
    end

    end









easygame3x3=[[1,nil,nil],[2,3,nil],[nil,nil,2]]
easygame4x4=[[4,nil,nil,nil],[nil,3,4,nil],[nil,1,2,nil],[nil,nil,nil,1]]
mediumgame6x6=[[nil,nil,nil,1,5,nil],[4,nil,3,nil,nil,nil],[nil,nil,nil,nil,nil,nil],[nil,3,nil,5,nil,2],[nil,nil,nil,nil,2,nil],[nil,nil,nil,nil,1,nil]]
hardfuckingame9x9=[[nil,nil,2,nil,3,nil,nil,nil,nil],[5,nil,nil,9,nil,nil,nil,2,7],[4,nil,6,nil,nil,2,5,nil,nil],[nil,4,nil,nil,nil,nil,9,nil,nil],[9,nil,nil,4,8,7,nil,nil,3],[nil,nil,5,nil,nil,nil,nil,7,nil],[nil,nil,4,2,nil,nil,3,nil,8],[8,3,nil,nil,nil,4,nil,nil,2],[nil,nil,nil,nil,6,nil,7,nil,nil]]

gameone=Game.new(hardfuckingame9x9)

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

